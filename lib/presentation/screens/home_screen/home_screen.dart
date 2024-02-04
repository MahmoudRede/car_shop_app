import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Scaffold(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
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

                      SizedBox(height: MediaQuery.sizeOf(context).height*.08,),

                      Image(
                        width: MediaQuery.sizeOf(context).height*.35,
                        image: const AssetImage('assets/images/car.png'),
                      ),

                      SizedBox(height: MediaQuery.sizeOf(context).height*.04,),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*.02),
                          margin: EdgeInsets.symmetric(
                              horizontal: MediaQuery.sizeOf(context).height*.01
                          ),
                          height: MediaQuery.sizeOf(context).height*.68,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: ColorManager.lightColor2,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [


                              ],
                            ),
                          ),
                        ),
                      ),



                    ]
                ),
              ),
            )
        );
      },
    );
  }
}
