import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/presentation/screens/brand_screen/brand_type.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class BrandYearScreen extends StatelessWidget {
  final int index;
   String brandName;
   String subBrandName;

   BrandYearScreen(
      {required this.index,
      required this.brandName,
      required this.subBrandName,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/splash_screen.png'),
        )),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .06,
            ),
            Text(
              'الماركات',
              style: TextStyle(
                  color: ColorManager.white,
                  fontSize: MediaQuery.sizeOf(context).height * .027,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).height * .02),
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
                        top: MediaQuery.sizeOf(context).height * .04,
                        right: MediaQuery.sizeOf(context).height * .03,
                      ),
                      child: Text(
                        subBrandName.isNotEmpty
                            ? '$brandName - $subBrandName'
                            : brandName,
                        style: TextStyle(
                            color: ColorManager.textColor,
                            fontSize: MediaQuery.sizeOf(context).height * .024,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .024,
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / .8,
                          mainAxisSpacing: MediaQuery.sizeOf(context).height * .02,
                          crossAxisSpacing: 0,
                        ),
                        itemBuilder:  (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(  BrandTypeScreen(index: index,
                                  brandName: brandName,
                                  subBrandName: subBrandName,
                                  startYear:
                                  subBrandName =="التيما" ? Constants.timaStart[index]:
                                  subBrandName =="فيرسا" ? Constants.versaStart[index]:
                                  subBrandName =="روج" ? Constants.rogStart[index]:
                                  subBrandName =="نافارا" ? Constants.nafaraStart[index]:
                                  subBrandName =="سني هندي" ? Constants.sunnyStart[index]:
                                  subBrandName =="جوك" ? Constants.gocStart[index]:
                                  Constants.syntraStart[index],
                                endYear: subBrandName =="التيما" ? Constants.timaEnd[index]:
                                subBrandName =="فيرسا" ? Constants.versaEnd[index]:
                                subBrandName =="روج" ? Constants.rogEnd[index]:
                                subBrandName =="نافارا" ? Constants.nafaraEnd[index]:
                                subBrandName =="سني هندي" ? Constants.sunnyEnd[index]:
                                subBrandName =="جوك" ? Constants.gocEnd[index]:
                                Constants.syntraEnd[index]


                              ),
                                  transition: Transition.fadeIn);
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
                                    child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            height: MediaQuery.sizeOf(context)
                                                .height *
                                                .12,
                                            image: const AssetImage(
                                                'assets/images/carImage.png'),
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        .03),
                                Text(
                                  subBrandName =="التيما" ? "${Constants.timaStart[index]} - ${Constants.timaEnd[index]}" :
                                  subBrandName =="فيرسا" ? "${Constants.versaStart[index]} - ${Constants.versaEnd[index]}" :
                                  subBrandName =="روج" ? "${Constants.rogStart[index]} - ${Constants.rogEnd[index]}" :
                                  subBrandName =="نافارا" ? "${Constants.nafaraStart[index]} - ${Constants.nafaraEnd[index]}" :
                                  subBrandName =="سني هندي" ? "${Constants.sunnyStart[index]} - ${Constants.syntraEnd[index]}" :
                                  subBrandName =="جوك" ? "${Constants.gocStart[index]} - ${Constants.gocEnd[index]}" :
                                  subBrandName =="سينترا" ? "${Constants.syntraStart[index]} - ${Constants.syntraEnd[index]}" :"",
                                  style: const TextStyle(
                                    color: ColorManager.textColor,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                         itemCount:
                      subBrandName =="التيما" ? Constants.timaStart.length :
                      subBrandName =="فيرسا" ? Constants.versaStart.length :
                      subBrandName =="روج" ? Constants.rogStart.length :
                      subBrandName =="نافارا" ? Constants.nafaraStart.length :
                      subBrandName =="سني هندي" ? Constants.sunnyStart.length :
                      subBrandName =="جوك" ? Constants.gocStart.length :
                      subBrandName =="سينترا" ? Constants.syntraStart.length : Constants.toyotaSubBrandName.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
