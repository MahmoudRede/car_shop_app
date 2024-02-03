import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/presentation/screens/brand_screen/brand_name.dart';
import 'package:shop_car/styles/colors/color_manager.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        SizedBox(height: MediaQuery.sizeOf(context).height*.01,),

        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).height*.02
          ),
          height: MediaQuery.sizeOf(context).height*.77,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFEBECF0),
                ColorManager.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
          ),

          child:GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1/.7,
            mainAxisSpacing: 20,
            crossAxisSpacing: 0,
            children: List.generate(Constants.brandImages.length, (index) => GestureDetector(
              onTap: (){

                Get.to(const BrandNameScreen(),transition: Transition.fadeIn);

              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15
                ),
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.white,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).height*.02
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                            Constants.brandImages[index],
                          ),
                        ),

                      ]
                    ),
                  ),
                ),
              ),
            )),
          ),
        )
      ]
    );
  }
}
