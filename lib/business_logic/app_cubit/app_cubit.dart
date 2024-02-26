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
import 'package:sqflite/sqflite.dart';

import '../../core/remote/dio_helper.dart';
import '../../data/models/product_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  List productsFavoritesControllers =
  List.generate(2000, (index) => TextEditingController());
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

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    currentIndex = 2;
    emit(SignOutSuccessState());
  }

  Future<void> deleteUser({
    required context,
  }) async {
    emit(DeleteUserLoadingState());

    FirebaseFirestore.instance
        .collection('Users')
        .doc("${CashHelper.removeData(key: "isUid")}")
        .delete()
        .then((value) {
      CashHelper.removeData(key: "isUid");
      customToast(title: "تم حذف حسابك بنجاح", color: Colors.red.shade700);

      debugPrint('Account Deleted Successfully');

      emit(DeleteUserSuccessState());
    }).catchError((error) {
      debugPrint('Error in DeleteUser is ${error.toString()}');
      emit(DeleteUserErrorState());
    });
  }

  Database? database;
  List<Map> allFavorite = [];

  void createDatabase() async {
    return await openDatabase('favorite.db', version: 1,
        onCreate: (database, version) {
          database
              .execute(
              'CREATE TABLE favorite (id INTEGER PRIMARY KEY , name TEXT , address TEXT, price TEXT, rate TEXT, image TEXT, favorite TEXT)')
              .then((value) {
            debugPrint('Table Created');
            emit(CreateTableState());
          });
        }, onOpen: (database) {
          getDatabase(database).then((value) {
            allFavorite = value;
          }).catchError((error) {
            debugPrint('error i ${error.toString()}');
          });
          debugPrint('Database Opened');
        }).then((value) {
      database = value;
      debugPrint('Database Created');
      emit(CreateDatabaseSuccessState());
    }).catchError((error) {
      debugPrint('error is ${error.toString()}');
      emit(CreateDatabaseErrorState());
    });
  }

  Future insertDatabase({
    required String name,
    required String code,
    required String price,
    required String number,
    required String image,
    required context,
  }) async {
    return database?.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO favorite (name,address,price,rate,image,favorite) VALUES ( "$name" , "$code" , "$price" , "$number" , "$image" , "yes")')
          .then((value) {
        debugPrint("$value Insert Success");
        emit(InsertDatabaseSuccessState());
        getDatabase(database).then((value) {
          allFavorite = value;
        });
        emit(InsertDatabaseSuccessState());
      }).catchError((error) {
        debugPrint('Error is ${error.toString()}');
      });
    });
  }

  Future<List<Map>> getDatabase(database) async {
    allFavorite = [];
    return await database?.rawQuery('SELECT * FROM favorite').then((value) {
      value.forEach((element) {
        allFavorite.add(element);
      });

      debugPrint(allFavorite.toString());
      emit(GetDatabaseSuccessState());
    }).catchError((error) {
      debugPrint('GetError is ${error.toString()}');
    });
  }

  Future deleteDatabase({required String id, required context}) async {
    return await database
        ?.rawDelete('DELETE FROM favorite WHERE id = ?', [id]).then((value) {
      debugPrint('Item Deleted');
      getDatabase(database).then((value) {
        allFavorite = value;
      }).catchError((error) {
        debugPrint('Error is ${error.toString()}');
      });
      emit(DeleteDatabaseSuccessState());
    });
  }

  void updateDatabase({
    required String number,
    required String id,
  }) async {
    database?.rawUpdate(
        'UPDATE favorite SET rate = ? WHERE id = ?',
        [number, id]).then((value) {
      debugPrint('Update Done');
      getDatabase(database);
      emit(UpdateNoteDatabaseState());
    }).catchError((error) {
      debugPrint('error is ${error.toString()}');
    });
  }


  ProductModel? products;

  List<MainProducts> myProducts = [];

  Future<void> getProductFromApi({
    required String factory,
    required String productModel,
    required String fromDate,
    required String toDate,
  }) async {
    // Map<String, dynamic> prameters = {
    //   'factory': factory,
    //   'productModel': productModel,
    //   'fromDate': fromDate,
    //   'toDate': toDate,
    // };

    emit(GetProductsFromApiLoadingState());
    DioHelper.postData(
      url: 'GetProducts?productModel=$productModel&factory=$factory&fromDate=$fromDate&toDate=$toDate',
    ).then((value) {
      debugPrint(
          'productModel=$productModel&factory=$factory&fromDate=$fromDate&toDate=$toDate');
      products = ProductModel.fromJson(value.data);
      myProducts = products!.mainProducts!;
      debugPrint("*******price is ${myProducts[0].price}");

      // print(products!.mainProducts[0]['ProductName']);
      emit(GetProductsFromApiSuccessState());
    }).catchError((error) {
      debugPrint('Error in Get Products From Api is :${error.toString()}');
      emit(GetProductsFromApiErrorState());
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(GetSearchLoadingState());
    DioHelper.postData(
      url: 'GetProducts?ItemName=$value',
    ).then((value) {
      search = value.data['MainProducts'];
      debugPrint(search[2]['ProductName']);
      emit(GetSearchSuccessState());
    }).catchError((error) {
      debugPrint('error during calling api ${error.toString()}');
      emit(GetSearchErrorState());
    });
  }

  ProductModel? bestSell;
  ProductModel? imageUrl;
  List<MainProducts>? bestSellProducts = [];

  Future<void> getMostProductSell() async {
    bestSellProducts = [];
    emit(GetBestSellProductsFromApiLoadingState());
    DioHelper.postData(
      url: 'GetProducts',
    ).then((value) {
      bestSell = ProductModel.fromJson(value.data);
      for (var element in bestSell!.mainProducts!) {
        if (element.bestSeller == true) {
          bestSellProducts!.add(element);
        }
      }
      // imageUrl = ProductModel.fromJson(value.data);
      // debugPrint('hi ${value.data}');
      // for (var element in imageUrl!.mainProducts!) {
      //   if (element.imgUrl!.isNotEmpty) {
      //     bestSellProducts!.add(element);
      //   }
      // }
      debugPrint('length ${bestSellProducts!.length}');
      emit(GetBestSellProductsFromApiSuccessState());
    }).catchError((error) {
      debugPrint('Error in Get BestSell Products From Api is :${error.toString()}');
      emit(GetBestSellProductsFromApiErrorState());
    });
  }

  ProductModel? newSell;
  List<MainProducts>? newSellProducts = [];

  Future<void> getNewProduct() async {
    newSellProducts = [];
    emit(GetNewSellProductsFromApiLoadingState());
    DioHelper.postData(
      url: 'GetProducts',
    ).then((value) {
      newSell = ProductModel.fromJson(value.data);
      debugPrint('${value.data}');
      for (var element in newSell!.mainProducts!) {
        if (element.newItem == true) {
          newSellProducts!.add(element);
        }
      }
      // imageUrl = ProductModel.fromJson(value.data);
      // imageUrl!.mainProducts!.forEach((element) {
      //   if (element.imgUrl == true) {
      //     newSellProducts!.add(element);
      //   }
      // });
      debugPrint('new length ${newSellProducts!.length}');
      emit(GetNewSellProductsFromApiSuccessState());
    }).catchError((error) {
      debugPrint('Error in Get NewSell Products From Api is :${error.toString()}');
      emit(GetNewSellProductsFromApiErrorState());
    });
  }

  ProductModel? favoriteProducts;

  Future<void> getFavoriteProductFromApi() async {
    emit(GetProductsFromApiLoadingState());
    await DioHelper.postData(
      url:
      'GetProducts?productModel=التيما&factory=نيسان&fromDate=2013&toDate=2018',
    ).then((value) {
      favoriteProducts = ProductModel.fromJson(value.data);

      // print(products!.mainProducts[0]['ProductName']);
      emit(GetProductsFromApiSuccessState());
    }).catchError((error) {
      debugPrint('Error in Get Products From Api is :${error.toString()}');
      emit(GetProductsFromApiErrorState());
    });
  }


}
