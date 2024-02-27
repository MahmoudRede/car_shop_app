import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import '../../../../styles/colors/color_manager.dart';

class FilesItem extends StatelessWidget {
  int index;

  FilesItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).height * .01),
      child: Material(
        elevation: 1.5,
        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height * .02),
        child: Container(
          height: MediaQuery.sizeOf(context).height * .175,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height * .02),
            color: ColorManager.white.withOpacity(.9),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // item details
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Name of product
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              AppCubit.get(context).cartList[index].productName!,
                              style: TextStyle(
                                fontSize: MediaQuery.sizeOf(context).height * .0185,
                                color: ColorManager.black,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .01,
                      ),

                      // description of product
                      Text(
                        AppCubit.get(context).cartList[index].productDescribtion!,
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: ColorManager.grey,
                        ),
                        textAlign: TextAlign.end,
                      ),

                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .01,
                      ),
                      // Total price and number of items
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppCubit.get(context).cartList[index].productPrice!,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                color: ColorManager.secondaryColor
                                    .withOpacity(.9),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .02,
                          ),
                          Text(
                            "SR",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const Spacer(),
                          Text(
                            " قطع${AppCubit.get(context).cartList[index].productPrice!}",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .02,
                          ),
                          Text(
                            " : متبقي ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .03,
                ),
                // image of product
                Expanded(
                  flex: 1,
                  child: CachedNetworkImage(
                    imageUrl:
                    AppCubit.get(context).cartList[index].productImage!,
                    height: MediaQuery.sizeOf(context).height * .15,
                    width: MediaQuery.sizeOf(context).height * .15,
                    placeholder: (context, url) =>
                    const Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.red,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Center(
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
                        ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
