import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/presentation/screens/item_details_screen/item_details_screen.dart';
import 'package:shop_car/presentation/screens/products_screen/widgets/product_item.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class ProductsScreen extends StatelessWidget {
  final int index;
  String brandName;
  String subBrandName;
  String startYear;
  String endYear;

  ProductsScreen(
      {required this.index,
      required this.brandName,
      required this.subBrandName,
      required this.startYear,
      required this.endYear,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/splash_screen.png'),
        )),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .06,
          ),
          Text(
            'المنتجات',
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
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height * .04,
                      right: MediaQuery.sizeOf(context).height * .03,
                    ),
                    child: Text(
                      '$brandName - $subBrandName - $startYear - $endYear',
                      style: TextStyle(
                          color: ColorManager.textColor,
                          fontSize: MediaQuery.sizeOf(context).height * .024,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .024,
                  ),
                  state is GetNewSellProductsFromApiLoadingState?
                  const Center(
                    child: CircularProgressIndicator(
                      color:  ColorManager.secondaryColor,
                    ),
                  )
                      : Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.5,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                              mainAxisExtent: MediaQuery.sizeOf(context).height * .35
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: ProductItem(
                              index: index,
                              brandName: brandName,
                              subBrandName: subBrandName,
                              startYear: startYear,
                              endYear: endYear,
                            onTap: () {
                               Get.to(

                                 ItemDetailsScreen(
                                   index: index,
                                   brandName: brandName,
                                   subBrandName: subBrandName,
                                   startYear: startYear,
                                   endYear: endYear,
                                   productName: '',
                                   productType: '',


                                 ));
                            },),
                        );
                      },
                      itemCount: AppCubit.get(context).myProducts.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  },
);
  }
}
