import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/core/local/cash_helper.dart';
import '../../../../styles/colors/color_manager.dart';

class SearchItem extends StatelessWidget {
  final int index;

  const SearchItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: MediaQuery.sizeOf(context).height * .25,
        width: double.infinity,
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
              InkWell(
                onTap: (){

                },
                child: const Icon(
                  Icons.favorite_border,
                  color: ColorManager.secondaryColor,
                ),
              ),

              // image of product

              Center(
                child: CachedNetworkImage(
                  imageUrl: '${AppCubit.get(context).search[index]['ImgUrl']}',
                  height: 70,
                  width: 70,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.secondaryColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
              ),
              SizedBox( height: MediaQuery.sizeOf(context).height * .01,),
              // Name of product
              Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  CashHelper.getData(key: CashHelper.languageKey).toString() ==
                          "ar"
                      ? AppCubit.get(context).search[index]['ProductName']
                      : AppCubit.get(context).search[index]['LatinName'],
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: MediaQuery.sizeOf(context).height * .02,
                    overflow: TextOverflow.fade,
                      ),
                  textAlign: TextAlign.end,
                ),
              ),

              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              // description of product
              Text(
                AppCubit.get(context).search[index]['ProductType'],
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
                    AppCubit.get(context).search[index]['Quantity'].toString(),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: MediaQuery.sizeOf(context).height * .015,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    AppCubit.get(context).search[index]['Price'].toString(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: MediaQuery.sizeOf(context).height * .02,
                        color: ColorManager.secondaryColor.withOpacity(.9),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).height * .004,
                  ),
                  Text(
                    "SR",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: MediaQuery.sizeOf(context).height * .018,
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
    );
  }
}
