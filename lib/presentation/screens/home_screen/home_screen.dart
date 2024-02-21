import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/presentation/screens/brand_screen/brand_name.dart';
import 'package:shop_car/presentation/screens/home_screen/widget/home_item.dart';
import 'package:shop_car/presentation/screens/notifications_screen/notifications_screen.dart';
import 'package:shop_car/presentation/screens/search_screen/search_screen.dart';
import 'package:shop_car/styles/colors/color_manager.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit=AppCubit.get(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
        child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const NotificationsScreen()));
                    },
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height*.025,
                      width: MediaQuery.sizeOf(context).height*.025,

                      child: SvgPicture.asset(
                        'assets/icons/notification.svg',
                      ),
                    ),
                  ),

                  SizedBox(width: MediaQuery.sizeOf(context).height*.03,),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchScreen()));
                    },
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height*.025,
                      width: MediaQuery.sizeOf(context).height*.025,
                      child: SvgPicture.asset(
                        'assets/icons/search.svg',
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.sizeOf(context).height*.02,),
                ],
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height*.01,),

              Image(
                width: MediaQuery.sizeOf(context).height*.25,
                image: const AssetImage('assets/images/car.png'),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height*.02,),

              /// models images list
              SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
              width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Get.to(
                              () => BrandNameScreen(
                                brandName: Constants.homeBrandName[index],
                                index: index,
                              )
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height*0.1,
                            width: MediaQuery.of(context).size.height*0.1,

                            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.01),
                              color: ColorManager.lightGrey,
                            ),

                            child: SvgPicture.asset(
                              Constants.homeBrandImages[index],
                              allowDrawingOutsideViewBox: true,
                              color: ColorManager.white,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context,index){
                        return SizedBox(width: MediaQuery.sizeOf(context).height*.02,);
                      },
                      itemCount: Constants.homeBrandImages.length,
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height*.02,),

              /// body of the screen
              Expanded(
                child: Container(
                  height: MediaQuery.sizeOf(context).height*.5,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFEBECF0),
                        ColorManager.darkWhite,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.sizeOf(context).height*.02,),

                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          SizedBox(height: MediaQuery.sizeOf(context).height*.01,),

                          /// tab bar for brands items
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.05,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context,index){
                                return Container(
                                  height: MediaQuery.of(context).size.height*0.05,
                                  width: MediaQuery.of(context).size.height*0.1,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.01),
                                    color: ColorManager.white,
                                  ),
                                  alignment: Alignment.center,

                                  child: Text(
                                      Constants.homeTabViewTitles[index],
                                      style: TextStyle(
                                        color: ColorManager.black,
                                        fontSize: MediaQuery.sizeOf(context).height*.02,
                                        fontWeight: FontWeight.w500
                                      ),
                                  ),
                                );
                              },
                              separatorBuilder: (context,index){
                                return SizedBox(width: MediaQuery.sizeOf(context).height*.01,);
                              },
                              itemCount: Constants.homeTabViewTitles.length,
                            ),
                          ),

                          SizedBox(height: MediaQuery.sizeOf(context).height*.02,),

                          /// last added items rows
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "المضاف حديثاً",
                                style: TextStyle(
                                    color: ColorManager.black,
                                    fontSize: MediaQuery.sizeOf(context).height*.02,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                "الكل",
                                style: TextStyle(
                                    color: ColorManager.secondaryColor,
                                    fontSize: MediaQuery.sizeOf(context).height*.016,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: MediaQuery.sizeOf(context).height*.4,
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return HomeItem(index: index, type: 'lastAdded',);
                                },
                                separatorBuilder: (context,index){
                                  return SizedBox(width: MediaQuery.sizeOf(context).height*.01,);
                                },
                                itemCount: cubit.newSellProducts!.length,
                            ),
                          ),

                          SizedBox(height: MediaQuery.sizeOf(context).height*.01,),

                          /// last Version items rows
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "الأكثر طلباً",
                                style: TextStyle(
                                    color: ColorManager.black,
                                    fontSize: MediaQuery.sizeOf(context).height*.02,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                "الكل",
                                style: TextStyle(
                                    color: ColorManager.secondaryColor,
                                    fontSize: MediaQuery.sizeOf(context).height*.016,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: MediaQuery.sizeOf(context).height*.4,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){
                                return HomeItem(index: index, type: 'mostSelling',);
                              },
                              separatorBuilder: (context,index){
                                return SizedBox(width: MediaQuery.sizeOf(context).height*.01,);
                              },
                              itemCount: cubit.bestSellProducts!.length,
                            ),
                          ),

                          SizedBox(height: MediaQuery.sizeOf(context).height*.01,),

                          /// Advised for items items rows
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "الموصى به",
                                style: TextStyle(
                                    color: ColorManager.black,
                                    fontSize: MediaQuery.sizeOf(context).height*.02,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                "الكل",
                                style: TextStyle(
                                    color: ColorManager.secondaryColor,
                                    fontSize: MediaQuery.sizeOf(context).height*.016,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: MediaQuery.sizeOf(context).height*.4,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){
                                return HomeItem(index: index, type: 'recommended',);
                              },
                              separatorBuilder: (context,index){
                                return SizedBox(width: MediaQuery.sizeOf(context).height*.01,);
                              },
                              itemCount: cubit.bestSellProducts!.length,
                            ),
                          ),


                          SizedBox(height: MediaQuery.sizeOf(context).height*.1,),
                        ],
                      ),
                    ),
                  ),
              )

        ),
            ],
      ),
      ),
    );
  },
);
  }
}
