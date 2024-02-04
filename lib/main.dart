
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/presentation/screens/home_layout/home_layout.dart';
import 'package:shop_car/presentation/screens/login_screen/login_screen.dart';
import 'package:shop_car/presentation/screens/notifications_screen/notifications_screen.dart';
import 'package:shop_car/styles/theme_manager/theme_manager.dart';

import 'presentation/screens/profile_screen/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){

            },
          builder: (context,state){
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                theme: getApplicationTheme(context),
                home: const HomeLayout(),
              );
          },
      ),
    );
  }
}


