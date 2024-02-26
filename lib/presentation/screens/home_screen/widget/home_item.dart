import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/presentation/screens/item_details_screen/item_details_screen.dart';
import '../../../../styles/colors/color_manager.dart';

class HomeItem extends StatelessWidget {
  int index;
  String type;

  HomeItem({required this.type, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return ItemDetailsScreen(
                productName: AppCubit.get(context)
                    .bestSellProducts![index].productName!,
                index: index,
                startYear: AppCubit.get(context)
                    .bestSellProducts![index]
                    .productionDate!,
                endYear: AppCubit.get(context)
                    .bestSellProducts![index]
                    .endDate!,
                price: AppCubit.get(context)
                    .bestSellProducts![index]
                    .quantity.toString(),
                imageUrl: AppCubit.get(context)
                    .bestSellProducts![index]
                    .imgUrl!,
                factoryName: AppCubit.get(context)
                    .bestSellProducts![index]
                    .factory!,
                quantity: AppCubit.get(context)
                    .bestSellProducts![index]
                    .quantity.toString(),
                productModel: AppCubit.get(context)
                    .bestSellProducts![index]
                    .productModel!,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: MediaQuery.sizeOf(context).height * .25,
          width: MediaQuery.sizeOf(context).height * .25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorManager.white.withOpacity(.9),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon of favorite
                const Icon(
                  Icons.favorite_border,
                  color: ColorManager.secondaryColor,
                ),

                // image of product
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(context).height * .15,
                  imageUrl: type == "lastAdded"
                      ? AppCubit.get(context).newSellProducts![index].imgUrl!
                      : type == "mostSelling"
                          ? AppCubit.get(context)
                              .bestSellProducts![index]
                              .imgUrl!
                          : AppCubit.get(context)
                              .bestSellProducts![index]
                              .imgUrl!,
                  errorWidget: (context, url, error) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: MediaQuery.sizeOf(context).height * .07,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .01,
                        ),
                        Center(
                          child: Text(
                            "الصورة غير متوفرة",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: ColorManager.red,
                                ),
                          ),
                        ),
                      ]),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.secondaryColor,
                    ),
                  ),
                ),

                // Name of product
                Text(
                  type == "lastAdded"
                      ? AppCubit.get(context)
                          .newSellProducts![index]
                          .productName!
                      : type == "mostSelling"
                          ? AppCubit.get(context)
                              .bestSellProducts![index]
                              .productName!
                          : AppCubit.get(context)
                              .bestSellProducts![index]
                              .productName!,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: MediaQuery.sizeOf(context).height * .02,
                      ),
                  textAlign: TextAlign.end,
                ),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .01,
                ),
                // description of product
                Text(
                  type == "lastAdded"
                      ? AppCubit.get(context)
                          .newSellProducts![index]
                          .productType!
                      : type == "mostSelling"
                          ? AppCubit.get(context)
                              .bestSellProducts![index]
                              .productType!
                          : type == "recommended"
                              ? AppCubit.get(context)
                                  .bestSellProducts![index]
                                  .productType!
                              : "",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: ColorManager.grey,
                      ),
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .01,
                ),

                // Total price and number of items
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.description_outlined,
                        color: ColorManager.black.withOpacity(.6)),
                    Text(
                      "${type == "lastAdded" ? AppCubit.get(context).newSellProducts![index].quantity! : type == "mostSelling" ? AppCubit.get(context).bestSellProducts![index].quantity! : type == "recommended" ? AppCubit.get(context).bestSellProducts![index].quantity! : ""}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                            fontSize: MediaQuery.sizeOf(context).height * .01,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      "${type == "lastAdded" ? AppCubit.get(context).newSellProducts![index].quantity! : type == "mostSelling" ? AppCubit.get(context).bestSellProducts![index].quantity! : type == "recommended" ? AppCubit.get(context).bestSellProducts![index].quantity! : ""}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                          fontSize: MediaQuery.sizeOf(context).height * .02,
                          color:
                          ColorManager.secondaryColor.withOpacity(.9),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width:  MediaQuery.sizeOf(context).width * .01,),
                    Text(
                      "SR ",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                            fontSize: MediaQuery.sizeOf(context).height * .015,
                          ),
                    ),
                  ],
                ),

                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
