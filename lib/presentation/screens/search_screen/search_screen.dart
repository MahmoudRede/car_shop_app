import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/core/local/cash_helper.dart';
import 'package:shop_car/presentation/screens/item_details_screen/item_details_screen.dart';
import 'package:shop_car/presentation/screens/search_screen/search_item.dart';
import 'package:shop_car/presentation/widgets/default_text_form_field.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var searchList = AppCubit.get(context).search;
        return Scaffold(
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
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
                    'البحث',
                    style: TextStyle(
                        color: ColorManager.white,
                        fontSize: MediaQuery.sizeOf(context).height * .027,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .01,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                MediaQuery.sizeOf(context).height * .02,
                              ),
                              child: DefaultTextFormField(
                                controller: searchController,
                                textInputType: TextInputType.text,
                                suffixImage: 'assets/images/search_icon.png',
                                hintText: 'اكتب هنا اسم المنتج ',
                                isPass: false,
                                isSearch: true,
                                onChanged: (value) {
                                  cubit.getSearch(value);
                                },
                              ),
                            ),
                            state is GetSearchLoadingState ?
                            const Center(
                              child: CircularProgressIndicator( color: ColorManager.secondaryColor),)
                                : Expanded(
                              child: GridView.count(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).height * .00,
                                ),
                                crossAxisCount: 2,
                                childAspectRatio: 1 / 1.7,
                                children: List.generate(
                                  searchList.length,
                                  (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => ItemDetailsScreen(
                                            productName:
                                                '${CashHelper.getData(key: CashHelper.languageKey).toString() == "ar" ? AppCubit.get(context).search[index]['ProductName'] : AppCubit.get(context).search[index]['LatinName']}',
                                            index: index,
                                            startYear:
                                                '${AppCubit.get(context).search[index]['ProductionDate']}',
                                            endYear:
                                                '${AppCubit.get(context).search[index]['EndDate']}',
                                            imageUrl:
                                                '${AppCubit.get(context).search[index]['ImgUrl']}',
                                            price:
                                                '${AppCubit.get(context).search[index]['Price']}',
                                            factoryName: '${AppCubit.get(context).search[index]['Factory']}',
                                            quantity: '${AppCubit.get(context).search[index]['Quantity']}',
                                            productModel: '${AppCubit.get(context).search[index]['ProductModel']}',
                                          ),
                                        );
                                      },
                                      child: SearchItem(
                                        index: index,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
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
