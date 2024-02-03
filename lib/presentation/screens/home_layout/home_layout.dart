import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class HomeLayout extends StatelessWidget{
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
      builder: (context,state){
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:  AssetImage('assets/images/splash_screen.png'),
                  )
              ),
              child: Column(
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height*.06,),

                    Text(Constants.screensTitle[AppCubit.get(context).currentIndex],style: TextStyle(
                      color: ColorManager.white,
                      fontSize: MediaQuery.sizeOf(context).height*.027,
                      fontWeight: FontWeight.bold
                    ),),

                    Constants.screens[AppCubit.get(context).currentIndex],

                    const Spacer(),

                    const BottomNavigationBarWidget(),

                    SizedBox(height:MediaQuery.sizeOf(context).height*.02),

                  ]
              ),
            ),
          );
      },
    );
  }
}
