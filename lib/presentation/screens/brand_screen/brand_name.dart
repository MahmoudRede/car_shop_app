import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/presentation/screens/brand_screen/brand_year.dart';
import 'package:shop_car/styles/colors/color_manager.dart';
import 'package:svg_flutter/svg.dart';

class BrandNameScreen extends StatelessWidget {
  final String brandName;
  final int index;

  const BrandNameScreen(
      {required this.brandName, required this.index, super.key});

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
          child: brandName == "تويوتا" || brandName == "نيسان"
              ? Column(
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
                            horizontal:
                                MediaQuery.sizeOf(context).height * .02),
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
                                Constants.brandName[index],
                                style: TextStyle(
                                    color: ColorManager.textColor,
                                    fontSize:
                                        MediaQuery.sizeOf(context).height *
                                            .024,
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
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                          BrandYearScreen(
                                            subBrandName: brandName ==
                                                "تويوتا"
                                                ? Constants
                                                .toyotaSubBrandName[
                                            index]
                                                : brandName == "نيسان"
                                                ? Constants
                                                .nissanSubBrandName[
                                            index]
                                                : "",
                                            index: index,
                                            brandName: brandName,
                                          ),
                                          transition: Transition.fadeIn);
                                    },
                                    child: Column(
                                      children: [
                                        Material(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          elevation: 10,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                              color: ColorManager.white,
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .center,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Image(
                                                    height:
                                                    MediaQuery.sizeOf(
                                                        context)
                                                        .height *
                                                        .12,
                                                    image: AssetImage(
                                                       brandName=="تويوتا" ? Constants
                                                            .toyotaSubBrandImages[
                                                        index]:
                                                       brandName=="نيسان" ? Constants.nissanSubBrandImages[index] : "0"),
                                                  ),
                                                ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                            MediaQuery.sizeOf(context)
                                                .height *
                                                .03),
                                        Text(
                                         brandName=="تويوتا" ?  Constants
                                              .toyotaSubBrandName[index] : brandName=="نيسان" ? Constants.nissanSubBrandName[index] : "0",
                                          style: const TextStyle(
                                            color: ColorManager.textColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                itemCount: brandName == "تويوتا" ? Constants.toyotaSubBrandName.length : brandName == "نيسان" ? Constants.nissanSubBrandName.length : 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : SingleChildScrollView(
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
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).height * .02,
                            vertical: MediaQuery.sizeOf(context).height * .01),
                        height: MediaQuery.sizeOf(context).height * .85,
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
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/empty.svg"),
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * .02,
                              ),
                              Text(
                                "لا يوجد منتجات",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}
