import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/presentation/screens/brand_screen/brand_name.dart';
import 'package:shop_car/presentation/screens/favorite_screen/favorite_screen.dart';
import 'package:shop_car/presentation/screens/notifications_screen/notifications_screen.dart';
import 'package:shop_car/presentation/screens/profile_screen/edit_profile_screen.dart';
import 'package:shop_car/styles/colors/color_manager.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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

            child:Column(
              children: [

                SizedBox(height: MediaQuery.sizeOf(context).height*.05,),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).height*.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                      SizedBox(width: MediaQuery.sizeOf(context).height*.02,),
                      Image(
                        image: const AssetImage('assets/images/logo.png'),
                        height: MediaQuery.sizeOf(context).height*.1,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: MediaQuery.sizeOf(context).height*.03,),

                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).height*.02
                  ),
                  child: Material(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height*.5,
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height*.02,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height*.02,
                      ),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: ListView.separated(
                          itemBuilder: (context,index){
                            return GestureDetector(
                              onTap: (){
                                if(index==0){
                                  Get.to(const EditProfileScreen(),transition: Transition.fadeIn);
                                }
                                if(index==1){
                                  Get.to(const NotificationsScreen(),transition: Transition.fadeIn);
                                }
                                if(index==3){
                                  Get.to(const FavoriteScreen(),transition: Transition.fadeIn);
                                }
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(Constants.profileTitles[index],style: TextStyle(
                                          color: ColorManager.textColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: MediaQuery.sizeOf(context).height*.017
                                      ),),
                                      SizedBox(width: MediaQuery.sizeOf(context).height*.02,),
                                      Image(
                                        image: AssetImage(Constants.profileImages[index]),
                                        color: ColorManager.secondaryColor,
                                        height: MediaQuery.sizeOf(context).height*.025,
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: MediaQuery.sizeOf(context).height*.01,),
                                  index!=6?const Divider():Container(),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context,index){
                            return SizedBox(height: MediaQuery.sizeOf(context).height*.01,);
                          },
                          itemCount: Constants.profileImages.length
                      ),
                    ),
                  ),
                ),
              ],
            )
          )
        ]
    );
  }
}
