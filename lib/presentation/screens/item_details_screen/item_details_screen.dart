import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/styles/colors/color_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemDetailsScreen extends StatelessWidget {
  final int index;
  String productName;
  String productType;
  String brandName;
  String subBrandName;
  String startYear;
  String endYear;
    ItemDetailsScreen({ required this.productName, required this.productType, required this.index, required this.brandName, required this.subBrandName, required this.startYear, required this.endYear, super.key});

  @override
  Widget build(BuildContext context) {
    PageController carouselCarController = PageController();
    PageController carouselItemsController = PageController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
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

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width*.05,),
                        Text(
                          "المنتج من الداخل",
                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: MediaQuery.sizeOf(context).height*.022,
                              fontWeight: FontWeight.w600
                          ),),

                        IconButton(
                          onPressed: (){
                            AppCubit.get(context).switchShowItemMoreDetails(false);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                          color: ColorManager.secondaryColor,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02),
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width,

                      decoration: BoxDecoration(
                        color: ColorManager.darkWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(MediaQuery.of(context).size.height*0.02),
                          topRight: Radius.circular(MediaQuery.of(context).size.height*0.02),
                        ),
                      ),


                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.02),
                          child: Column(
                            children: [

                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                              /// car images slider
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.2,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0.25, 1.0],
                                      colors: [ColorManager.white, ColorManager.lightGrey],
                                    ),
                                  ),

                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      PageView(
                                        controller: carouselCarController,
                                        children: Constants.itemDetailsCarsImage
                                            .map((e) => Padding(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.015),
                                          child: Image.asset(e),
                                        ))
                                            .toList(),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01),
                                        child: SmoothPageIndicator(
                                          controller: carouselCarController,
                                          count: Constants.itemDetailsCarsImage.length,
                                          effect: ExpandingDotsEffect(
                                              spacing: 8.0,
                                              radius: 4.0,
                                              dotWidth: MediaQuery.of(context).size.height * .008,
                                              dotHeight: MediaQuery.of(context).size.height* .005,
                                              strokeWidth: 1.5,
                                              dotColor: ColorManager.white,
                                              activeDotColor: ColorManager.secondaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                              /// item info details
                              Visibility(
                                visible: false,
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.28,

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
                                        color: ColorManager.darkWhite2
                                    ),

                                    child: Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01) ,//EdgeInsets.symmetric(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'سيارة تويوتا',
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.height*0.02,
                                                      fontWeight: FontWeight.w600
                                                  ),
                                                ),
                                                Text(
                                                  'رقم الطلب : 54513134',
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.height*0.018,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01) ,//EdgeInsets.symmetric(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'كامري',
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.height*0.02,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                                Text(
                                                  'تاريخ الطلب : 21/2/2021',
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.height*0.018,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01) ,//EdgeInsets.symmetric(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'موديل : 2017',
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.height*0.02,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                                Text(
                                                  'عدد القطع : 1',
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.height*0.018,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Text(
                                            'رقم الهيكل :  5214545121011',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height*0.018,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),

                                          Text(
                                            'وصف الطلب',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height*0.021,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),

                                          Text(
                                            'القطعة : 1',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height*0.021,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),

                                          Padding(
                                            padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01) ,//EdgeInsets.symmetric(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'موتور كامل',
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.height*0.02,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),
                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.04,
                                                  width: MediaQuery.of(context).size.height*0.1,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.05),
                                                      color: ColorManager.darkWhite
                                                  ),
                                                  child: Text(
                                                    'كوري',
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(context).size.height*0.02,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                              /// item images with info details
                              Visibility(
                                visible: !AppCubit.get(context).showItemMoreDetails,
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.32,

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
                                        color: ColorManager.darkWhite2
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height*0.2,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: (){
                                                    carouselItemsController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                                                  },
                                                  child: Material(
                                                    elevation: 2,
                                                    borderRadius: BorderRadius.circular(1000),
                                                    child: Container(
                                                      height: MediaQuery.of(context).size.height*0.035,
                                                      width: MediaQuery.of(context).size.height*0.035,
                                                      alignment: Alignment.center,

                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(1000),
                                                          color: ColorManager.white
                                                      ),

                                                      child: Icon(
                                                        Icons.arrow_back_ios,
                                                        color: ColorManager.grey,
                                                        size: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: PageView(
                                                    controller: carouselItemsController,
                                                    children: Constants.itemDetailsItemsImage
                                                        .map((e) => Padding(
                                                      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.015),
                                                      child: Image.asset(e),
                                                    ))
                                                        .toList(),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    carouselItemsController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                                                  },
                                                  child: Material(
                                                    elevation: 2,
                                                    borderRadius: BorderRadius.circular(1000),
                                                    child: Container(
                                                      height: MediaQuery.of(context).size.height*0.035,
                                                      width: MediaQuery.of(context).size.height*0.035,
                                                      alignment: Alignment.center,

                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(1000),
                                                          color: ColorManager.white
                                                      ),

                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: ColorManager.grey,
                                                        size: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01) ,//EdgeInsets.symmetric(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      brandName,
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(context).size.height*0.02,
                                                          fontWeight: FontWeight.w600
                                                      ),
                                                    ),
                                                    SizedBox(width: MediaQuery.of(context).size.height*0.01,),
                                                    Text(
                                                      subBrandName,
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(context).size.height*0.02,
                                                          fontWeight: FontWeight.w400
                                                      ),
                                                    ),
                                                    SizedBox(width: MediaQuery.of(context).size.height*0.01,),
                                                    Text(
                                                      startYear,
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(context).size.height*0.02,
                                                          fontWeight: FontWeight.w400
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.04,
                                                  width: MediaQuery.of(context).size.height*0.1,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.05),
                                                      color: ColorManager.darkWhite
                                                  ),
                                                  child: Text(
                                                    'كوري',
                                                    style: TextStyle(
                                                        fontSize: MediaQuery.of(context).size.height*0.02,
                                                        fontWeight: FontWeight.w400
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),


                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      productType,
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(context).size.height*0.02,
                                                          fontWeight: FontWeight.w400
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'SR',
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(context).size.height*0.02,
                                                          fontWeight: FontWeight.w400
                                                      ),
                                                    ),
                                                    SizedBox(width: MediaQuery.of(context).size.height*0.005,),
                                                    Text(
                                                      '3500',
                                                      style: TextStyle(
                                                          fontSize: MediaQuery.of(context).size.height*0.03,
                                                          fontWeight: FontWeight.w700,
                                                          color: ColorManager.secondaryColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: !AppCubit.get(context).showItemMoreDetails,
                                  child: SizedBox(height: MediaQuery.of(context).size.height*0.02,)
                              ),

                              /// item images only details
                              Visibility(
                                visible: AppCubit.get(context).showItemMoreDetails,
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.2,

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
                                        color: ColorManager.darkWhite2
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: MediaQuery.of(context).size.height*0.2,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                carouselItemsController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                                              },
                                              child: Material(
                                                elevation: 2,
                                                borderRadius: BorderRadius.circular(1000),
                                                child: Container(
                                                  height: MediaQuery.of(context).size.height*0.035,
                                                  width: MediaQuery.of(context).size.height*0.035,
                                                  alignment: Alignment.center,

                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(1000),
                                                      color: ColorManager.white
                                                  ),

                                                  child: Icon(
                                                    Icons.arrow_back_ios,
                                                    color: ColorManager.grey,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: PageView(
                                                controller: carouselItemsController,
                                                children: Constants.itemDetailsItemsImage
                                                    .map((e) => Padding(
                                                  padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.015),
                                                  child: Image.asset(e),
                                                ))
                                                    .toList(),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){
                                                carouselItemsController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                                              },
                                              child: Material(
                                                elevation: 2,
                                                borderRadius: BorderRadius.circular(1000),
                                                child: Container(
                                                  height: MediaQuery.of(context).size.height*0.035,
                                                  width: MediaQuery.of(context).size.height*0.035,
                                                  alignment: Alignment.center,

                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(1000),
                                                      color: ColorManager.white
                                                  ),

                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    color: ColorManager.grey,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // sizebox
                              Visibility(
                                visible: AppCubit.get(context).showItemMoreDetails,
                                child: SizedBox(height: MediaQuery.of(context).size.height*0.035,),
                              ),


                              /// item seller details
                              Visibility(
                                visible: AppCubit.get(context).showItemMoreDetails,
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.15,

                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.02),
                                      color: ColorManager.darkWhite2
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01) ,//EdgeInsets.symmetric(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'اسم التاجر',
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.height*0.018,
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),


                                              Text(
                                                'الشماسي لقطع الغير',
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.height*0.014,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height*0.015,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.015),
                                            child: const Divider(color: ColorManager.darkWhite,),
                                          ),
                                        ),
                                        Padding(
                                          padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01) ,//EdgeInsets.symmetric(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'عنوان التاجر',
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.height*0.018,
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),


                                              Text(
                                                'الصناعية، شارع،47323',
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.height*0.014,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context).size.height*0.015,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.015),
                                            child: const Divider(color: ColorManager.darkWhite,),
                                          ),
                                        ),
                                        Padding(
                                          padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01) ,//EdgeInsets.symmetric(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'التقييم',
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.height*0.018,
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),

                                              Image.asset('assets/images/rating.png',height: MediaQuery.of(context).size.height*0.015,),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ///sized box
                              Visibility(
                                visible: AppCubit.get(context).showItemMoreDetails,
                                child: SizedBox(height: MediaQuery.of(context).size.height*0.035,),
                              ),



                              /// priceing details
                              Visibility(
                                visible: AppCubit.get(context).showItemMoreDetails,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01) ,//EdgeInsets.symmetric(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'قيمة التوصيل',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height*0.02,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),


                                          Text(
                                            '17  SR',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height*0.018,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.015,),


                                    Padding(
                                      padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01) ,//EdgeInsets.symmetric(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'القيمه المضافة',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height*0.02,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),


                                          Text(
                                            '3  SR',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height*0.018,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.015,),

                                    Padding(
                                      padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01) ,//EdgeInsets.symmetric(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'الإجمالي المبلغ',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height*0.02,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),


                                          Row(
                                            children: [
                                              Text(
                                                'SR',
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.height*0.018,
                                                    fontWeight: FontWeight.w400
                                                ),
                                              ),
                                              SizedBox(width: MediaQuery.of(context).size.height*0.01,),
                                              Text(
                                                '3500',
                                                style: TextStyle(
                                                    fontSize: MediaQuery.of(context).size.height*0.02,
                                                    fontWeight: FontWeight.w600,
                                                    color: ColorManager.secondaryColor
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                                    Padding(
                                      padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.01) ,//EdgeInsets.symmetric(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'تحميل فاتورة ضريبة القيمة المضافة',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height*0.014,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),


                                          const Icon(
                                            Icons.download_rounded,
                                            color: ColorManager.black,
                                            size: 26,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),

                                    /// add to card
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.06,
                                      width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.05),
                                          color: ColorManager.secondaryColor
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.02),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'اضافة سريعة',
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.height*0.015,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),

                                            Container(
                                              height: MediaQuery.of(context).size.height*0.04,
                                              width: MediaQuery.of(context).size.height*0.04,
                                              alignment: Alignment.center,

                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(1000),
                                                  color: ColorManager.white
                                              ),

                                              child: const Icon(
                                                Icons.shopping_cart_outlined,
                                                color: ColorManager.secondaryColor,
                                                size: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                  ],
                                ),
                              ),


                              Visibility(
                                visible: !AppCubit.get(context).showItemMoreDetails,
                                child: Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        /// share button
                                        Row(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context).size.height*0.05,
                                              width: MediaQuery.of(context).size.height*0.05,
                                              alignment: Alignment.center,

                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(1000),
                                                  color: ColorManager.white
                                              ),

                                              child: Icon(
                                                Icons.ios_share_outlined,
                                                color: ColorManager.grey,
                                                size: 20,
                                              ),
                                            ),

                                            SizedBox(width: MediaQuery.of(context).size.height*0.02,),

                                            /// favorite button
                                            Container(
                                              height: MediaQuery.of(context).size.height*0.05,
                                              width: MediaQuery.of(context).size.height*0.05,
                                              alignment: Alignment.center,

                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(1000),
                                                  color: ColorManager.white
                                              ),

                                              child: const Icon(
                                                Icons.favorite_border,
                                                color: ColorManager.secondaryColor,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),


                                        Container(
                                          height: MediaQuery.of(context).size.height*0.05,
                                          width: MediaQuery.of(context).size.height*0.18,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.05),
                                              color: ColorManager.secondaryColor
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  'اضافة سريعة',
                                                  style: TextStyle(
                                                      fontSize: MediaQuery.of(context).size.height*0.015,
                                                      fontWeight: FontWeight.w400
                                                  ),
                                                ),

                                                Container(
                                                  height: MediaQuery.of(context).size.height*0.04,
                                                  width: MediaQuery.of(context).size.height*0.04,
                                                  alignment: Alignment.center,

                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(1000),
                                                      color: ColorManager.white
                                                  ),

                                                  child: const Icon(
                                                    Icons.shopping_cart_outlined,
                                                    color: ColorManager.secondaryColor,
                                                    size: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),


                              /// more details button
                              Visibility(
                                visible: !AppCubit.get(context).showItemMoreDetails,
                                child: InkWell(
                                  onTap: (){
                                    AppCubit.get(context).switchShowItemMoreDetails(true);
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.06,
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.05),
                                        color: ColorManager.lightGrey
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(width: MediaQuery.of(context).size.height*0.01,),
                                          Text(
                                            'التفاصيل',
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.height*0.021,
                                                fontWeight: FontWeight.w400
                                            ),
                                          ),

                                          Container(
                                            height: MediaQuery.of(context).size.height*0.04,
                                            width: MediaQuery.of(context).size.height*0.04,
                                            alignment: Alignment.center,

                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(1000),
                                                color: ColorManager.white
                                            ),

                                            child: const Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorManager.secondaryColor,
                                              size: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
