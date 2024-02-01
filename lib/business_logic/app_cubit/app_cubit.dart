
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/constants/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isValue=false;
  void switchTerms(bool value){

    isValue=value;
    emit(SwitchTermsState());
  }

  int currentIndex=0;

  void switchIconColor(int index){

    currentIndex=index;
    Constants.iconColors=List.generate(5, (index) => false);
    Constants.iconColors[index]=!Constants.iconColors[index];
    emit(SwitchTermsState());
  }



}