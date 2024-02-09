import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/presentation/screens/brand_screen/brand_name.dart';
import 'package:shop_car/presentation/screens/cart_screen/widgets/cart_item.dart';
import 'package:shop_car/presentation/screens/favorite_screen/widget/favorite_item.dart';
import 'package:shop_car/presentation/screens/files_screen/widget/FileItem.dart';
import 'package:shop_car/presentation/widgets/default_button.dart';
import 'package:shop_car/presentation/widgets/default_text_form_field.dart';
import 'package:shop_car/styles/colors/color_manager.dart';
import 'package:svg_flutter/svg_flutter.dart';

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

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

              Text('طلباتى',style: TextStyle(
                  color: ColorManager.white,
                  fontSize: MediaQuery.sizeOf(context).height*.027,
                  fontWeight: FontWeight.bold
              ),),

              SizedBox(height: MediaQuery.sizeOf(context).height*.01,),

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

                    child:ListView.separated(
                       padding: EdgeInsets.only(
                         top: MediaQuery.sizeOf(context).height*.02,
                       ),
                        itemBuilder: (context, index) {
                          return FilesItem(index: index,);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height * .001,
                          );
                        },
                        itemCount: 7
                    ),
                ),
              )
            ]
        ),
      ),
    );
  }
}
