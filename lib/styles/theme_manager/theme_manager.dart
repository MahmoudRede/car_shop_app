import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(
      primaryColor: ColorManager.primaryColor,
      useMaterial3: true,
      fontFamily: 'Nunito',
      // app bar theme
      appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: ColorManager.primaryColor,
          titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: ColorManager.white,
                fontSize: 20,
                fontFamily: 'Nunito',
              ),
          iconTheme: const IconThemeData(
            color: ColorManager.white,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorManager.primaryColor,
            statusBarIconBrightness: Brightness.light,
          )),
//text theme
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
            fontSize: 16, fontFamily: 'Nunito', color: ColorManager.black),
        headlineMedium: TextStyle(
            fontSize: 20, fontFamily: 'Nunito', color: ColorManager.black),
        headlineLarge: TextStyle(
            fontSize: 24, fontFamily: 'Nunito', color: ColorManager.black),
      ),


      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          color: ColorManager.primaryColor,
          fontSize: MediaQuery.sizeOf(context).height * 0.017,
        ),
        unselectedLabelStyle: TextStyle(
          color: ColorManager.black,
          fontSize: MediaQuery.sizeOf(context).height * 0.014,
        ),
        selectedItemColor: ColorManager.primaryColor,
        unselectedItemColor: ColorManager.black.withOpacity(.3),
        selectedIconTheme:  IconThemeData(
          color: ColorManager.primaryColor,
          size: MediaQuery.sizeOf(context).width * 0.061,
        ),
        unselectedIconTheme: IconThemeData(
          color: ColorManager.black.withOpacity(.3),
          size: MediaQuery.sizeOf(context).width * 0.06,
        ),
      ),
  );
}
