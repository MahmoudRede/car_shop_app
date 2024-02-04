import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/presentation/screens/brand_screen/brand_name.dart';
import 'package:shop_car/presentation/widgets/default_button.dart';
import 'package:shop_car/presentation/widgets/default_text_form_field.dart';
import 'package:shop_car/styles/colors/color_manager.dart';
import 'package:svg_flutter/svg_flutter.dart';

class EditProfileScreen extends StatelessWidget {
  static var nameController=TextEditingController();
  static var phoneController=TextEditingController();
  static var emailController=TextEditingController();
  static var cityController=TextEditingController();
  static var passController=TextEditingController();
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

                SizedBox(height: MediaQuery.sizeOf(context).height*.06,),

                Text('البروفيل',style: TextStyle(
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

                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(height: MediaQuery.sizeOf(context).height*.05,),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.sizeOf(context).height*.05,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image(
                                    image: const AssetImage('assets/images/logo.png'),
                                    height: MediaQuery.sizeOf(context).height*.1,
                                  ),
                                  SizedBox(width: MediaQuery.sizeOf(context).height*.02,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('خالد الشهري',style: TextStyle(
                                          color: ColorManager.textColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.sizeOf(context).height*.03
                                      ),),
                                      Text('info@gmail.com',style: TextStyle(
                                          color: ColorManager.grey,
                                          fontSize: MediaQuery.sizeOf(context).height*.015
                                      ),),

                                    ],
                                  ),

                                ],
                              ),
                            ),

                            SizedBox(height: MediaQuery.sizeOf(context).height*.05,),

                            // name
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.sizeOf(context).height*.02,
                              ),
                              child: DefaultTextFormField(
                                  controller: nameController,
                                  textInputType: TextInputType.text,
                                  suffixImage: 'assets/images/pencil.png',
                                  hintText: 'خالد الشهري',

                              ),
                            ),
                            SizedBox(height: MediaQuery.sizeOf(context).height*.02,),

                            // phone
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.sizeOf(context).height*.02,
                              ),
                              child: DefaultTextFormField(
                                  controller: phoneController,
                                  textInputType: TextInputType.text,
                                  suffixImage: 'assets/images/pencil.png',
                                  hintText: '0960000000',

                              ),
                            ),
                            SizedBox(height: MediaQuery.sizeOf(context).height*.02,),

                            // email
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.sizeOf(context).height*.02,
                              ),
                              child: DefaultTextFormField(
                                  controller: emailController,
                                  textInputType: TextInputType.text,
                                  suffixImage: 'assets/images/pencil.png',
                                  hintText: 'info@gmail.com',

                              ),
                            ),
                            SizedBox(height: MediaQuery.sizeOf(context).height*.02,),

                            // city
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.sizeOf(context).height*.02,
                              ),
                              child: DefaultTextFormField(
                                  controller: cityController,
                                  textInputType: TextInputType.text,
                                  suffixImage: 'assets/images/pencil.png',
                                  hintText: 'الدمام',

                              ),
                            ),
                            SizedBox(height: MediaQuery.sizeOf(context).height*.02,),

                            // password
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.sizeOf(context).height*.02,
                              ),
                              child: DefaultTextFormField(
                                  controller: passController,
                                  textInputType: TextInputType.text,
                                  suffixImage: 'assets/images/pencil.png',
                                  hintText: 'كلمه المرور',
                              ),
                            ),

                            SizedBox(height: MediaQuery.sizeOf(context).height*.07,),

                            // save button
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.sizeOf(context).height*.02,
                              ),
                              child: DefaultButton(
                                onPressed: (){

                                },
                                backGroundColor: ColorManager.secondaryColor,
                                height: MediaQuery.sizeOf(context).height*.06,
                                width: double.infinity,
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Text('حفظ',style: TextStyle(
                                      color: ColorManager.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: MediaQuery.sizeOf(context).height*.025,
                                    )),

                                    const Image(
                                        image: AssetImage(
                                          'assets/images/arrow.png',
                                        )
                                    ),

                                  ],
                                ),),
                            ),

                          ],
                        ),
                      )
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
