import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import '../../../../styles/colors/color_manager.dart';

class ProductItem extends StatelessWidget {
  final int index;
  String brandName;
  String subBrandName;
  String startYear;
  String endYear;

  void Function()? onTap;

  ProductItem(
      {required this.index,
      required this.brandName,
      required this.subBrandName,
      required this.startYear,
      required this.endYear,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return GestureDetector(
          onTap:  onTap,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.sizeOf(context).height * .25,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorManager.white.withOpacity(.9),
              ),
              child: state is GetProductsFromApiLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.secondaryColor,
                      ),
                    )
                  : GestureDetector(
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon of favorite
                            GestureDetector(
                              onTap: () {

                              },
                              child: const Icon(
                                Icons.favorite_border,
                                color: ColorManager.secondaryColor,
                              ),
                            ),

                            // image of product
                            Align(
                              alignment: Alignment.centerRight,
                              child: CachedNetworkImage(
                                imageUrl: cubit.myProducts[index].imgUrl ?? "",
                                errorWidget: (context, url, error) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/logo.png',
                                      height:
                                          MediaQuery.sizeOf(context).height * .07,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height * .01,
                                    ),
                                    Center(
                                      child: Text(
                                        "الصورة غير متوفرة",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              color: ColorManager.secondaryColor,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorManager.secondaryColor,
                                  ),
                                ),
                                fit: BoxFit.cover,
                                height: MediaQuery.sizeOf(context).height * .15,
                              ),
                            ),

                            // Name of product
                            Text(
                              cubit.myProducts[index].productName!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontSize:
                                          MediaQuery.sizeOf(context).height * .018,
                                      overflow: TextOverflow.ellipsis),
                              textAlign: TextAlign.end,
                            ),

                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * .01,
                            ),
                            // description of product
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                cubit.myProducts[index].productType!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: ColorManager.grey,
                                    ),
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * .01,
                            ),

                            // Total price and number of items
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  cubit.myProducts[index].quantity!.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                        fontSize:
                                            MediaQuery.sizeOf(context).height * .02,
                                        color: ColorManager.secondaryColor
                                            .withOpacity(.9),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  "SR",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontSize:
                                            MediaQuery.sizeOf(context).height *
                                                .012,
                                      ),
                                ),
                                const Spacer(),
                                Text(
                                  cubit.myProducts[index].quantity!.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontSize:
                                            MediaQuery.sizeOf(context).height * .018,
                                      ),
                                ),
                                Icon(Icons.description_outlined,
                                    color: ColorManager.black.withOpacity(.6))
                              ],
                            ),

                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * .02,
                            ),
                          ],
                        ),
                      ),
                  ),
            ),
          ),
        );
      },
    );
  }
}
