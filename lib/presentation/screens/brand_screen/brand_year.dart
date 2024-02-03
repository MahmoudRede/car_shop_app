import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/presentation/screens/brand_screen/brand_type.dart';
import 'package:shop_car/presentation/screens/brand_screen/brand_year.dart';
import 'package:shop_car/styles/colors/color_manager.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BrandYearScreen extends StatelessWidget {
  const BrandYearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

              Text('الماركات',style: TextStyle(
                  color: ColorManager.white,
                  fontSize: MediaQuery.sizeOf(context).height*.027,
                  fontWeight: FontWeight.bold
              ),),

              SizedBox(height: MediaQuery.sizeOf(context).height*.02,),

              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).height*.02
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFEBECF0),
                        ColorManager.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height*.04,
                          right: MediaQuery.sizeOf(context).height*.03,
                        ),
                        child: Text('تويوتا - كامري',style: TextStyle(
                            color: ColorManager.textColor,
                            fontSize: MediaQuery.sizeOf(context).height*.024,
                            fontWeight: FontWeight.w500
                        ),),
                      ),

                      SizedBox(height: MediaQuery.sizeOf(context).height*.024,),

                      Expanded(
                        child: GridView.count(
                          padding: EdgeInsets.zero,
                          crossAxisCount: 2,
                          childAspectRatio: 1/.8,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 0,
                          children: List.generate(Constants.brandImages.length, (index) => GestureDetector(
                            onTap: (){
                              Get.to(const BrandTypeScreen(),transition: Transition.fadeIn);
                            },
                            child: Column(
                              children: [
                                Material(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorManager.white,
                                    ),
                                    child:  Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          Image(
                                            height: MediaQuery.sizeOf(context).height*.12,
                                            image: const AssetImage('assets/images/carImage.png'),
                                          ),

                                        ]
                                    ),
                                  ),
                                ),
                                SizedBox(height: MediaQuery.sizeOf(context).height*.03),

                                const Text('2019-2017',style: TextStyle(
                                  color: ColorManager.textColor,

                                ),)
                              ],
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ]
        ),
      ),
    );
  }
}
