import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/core/local/cash_helper.dart';
import 'package:shop_car/data/models/user_model.dart';
import 'package:shop_car/presentation/widgets/custom_toast.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isValue = false;

  void switchTerms(bool value) {
    isValue = value;
    emit(SwitchTermsState());
  }

  int currentIndex = 2;

  void switchIconColor(int index) {
    currentIndex = index;
    Constants.iconColors = List.generate(5, (index) => false);
    Constants.iconColors[index] = !Constants.iconColors[index];
    emit(SwitchTermsState());
  }

  void increaseCartCounter(int index) {
    Constants.counter[index]++;
    emit(IncreaseCartCounterState());
  }

  void decreaseCartCounter(int index) {
    if (Constants.counter[index] > 1) {
      Constants.counter[index]--;
    } else {
      Constants.counter[index] = 1;
    }
    emit(DecreaseCartCounterState());
  }

  bool showItemMoreDetails=false;
  void switchShowItemMoreDetails(bool value){
    showItemMoreDetails= value;
    emit(SwitchShowItemMoreDetailsState());
  }

  UserModel? userModel;

//   Sign up with firebase
  void signUpWithFirebase({
    required String userName,
    required String email,
    required String phoneNumber,
    required String city,
    required String password,
  }) async {
    emit(SignUpWithFirebaseLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userModel = UserModel(
        userName: userName,
        phoneNumber: phoneNumber,
        email: email,
        uId: credential.user!.uid,
        city: city,
      );
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(credential.user!.uid)
          .set(userModel!.toJson())
          .then((value) {
        emit(SignUpWithFirebaseSuccessState());
      });
    } catch (error) {
      debugPrint("error in sign up with firebase ${error.toString()}");
      emit(SignUpWithFirebaseErrorState());
    }
  }

//   Login with firebase
  Future<void> loginWithFirebaseAuth(
      {required String email, required String password}) async {
    try {
      emit(SignInWithFirebaseLoadingState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel? user = await readUserFromFireStore(credential.user?.uid ?? "");
      if (user == null) {
        return customToast(
            title: '''This account doesn't exists''',
            color: Colors.red.shade700);
      } else {
        CashHelper.saveData(key: 'isUid', value: credential.user?.uid);
        emit(SignInWithFirebaseSuccessState());
        await getUser(id: (credential.user?.uid)!);
        debugPrint(CashHelper.getData(key: 'isUid'));
        debugPrint("-----------Login Successfully");
        return;
      }
    } on FirebaseAuthException catch (e) {
      emit(SignInWithFirebaseErrorState());
      debugPrint("-----------Login Failed ${e.toString()}");

      customToast(title: 'Invalid email or password', color: ColorManager.red);
    } catch (e) {
      customToast(title: 'Something went wrong $e', color: ColorManager.red);
    }
  }

  // Save user

  Future<void> saveUser({
    required String name,
    required String email,
    required String phoneNumber,
    required String city,
    required String id,
  }) async {
    emit(SaveUserLoadingState());

    UserModel userModel = UserModel(
      userName: name,
      phoneNumber: phoneNumber,
      email: email,
      uId: id,
      city: city,
    );


  bool showItemMoreDetails=false;
  void switchShowItemMoreDetails(bool value){
    showItemMoreDetails= value;
    emit(SwitchShowItemMoreDetailsState());
  }



    FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel.uId)
        .set(userModel.toJson())
        .then((value) {
      debugPrint('Save User Success');
      emit(SaveUserSuccessState());
    }).catchError((error) {
      debugPrint('Error in userRegister is ${error.toString()}');
      emit(SaveUserErrorState());
    });
  }

  // Get user
  Future<void> getUser({required String id}) async {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('Users').doc(id).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      debugPrint(userModel!.userName);
      debugPrint('get user success');
      emit(GetUserSuccessState());
    }).catchError((error) {
      debugPrint(error);
      emit(GetUserErrorState());
    });
  }
  // Hold user collection
  CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter(
      fromFirestore: (snapshot, options) =>
          UserModel.fromJson(snapshot.data()!),
      toFirestore: (value, options) => value.toJson(),
    );
  }
  // Read user from firebase
  Future<UserModel?> readUserFromFireStore(String id) async {
    DocumentSnapshot<UserModel> user = await getUsersCollection().doc(id).get();
    var myUser = user.data();
    return myUser;
  }


}
