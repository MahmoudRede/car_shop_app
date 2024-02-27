import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import '../../../../styles/colors/color_manager.dart';

class FavoriteItem extends StatelessWidget {
  int index;

  FavoriteItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context,state){},
        builder: (context,state){

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

                          // Icon of favorite
                          GestureDetector(
                            onTap: () {
                              AppCubit.get(context).updateDatabase(number: 'no', id: "${AppCubit.get(context).allFavorite[index]['id']}");
                              AppCubit.get(context).favoriteValues=List.generate(500, (index) => false);
                            },
                            child: const Icon(
                              Icons.favorite,
                              color: ColorManager.secondaryColor,
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .01,
                          ),

                          // Name of product
                          Text(AppCubit.get(context).allFavorite[index]['name'],
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontSize: MediaQuery.sizeOf(context).height * .022,
                            ),
                            textAlign: TextAlign.end,
                            maxLines: 2,
                          ),


                          const SizedBox(height: 10,),
                          // description of product
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              AppCubit.get(context).allFavorite[index]['address'],
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: ColorManager.grey,
                                fontSize: MediaQuery.sizeOf(context).height * .02,
                              ),
                              textAlign: TextAlign.end,),
                          ),

                          const SizedBox(height: 10,),

                          // Total price and number of items
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                AppCubit.get(context).allFavorite[index]['price'],
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
                                AppCubit.get(context).allFavorite[index]['rate'],
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
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            fit: BoxFit.cover,
                            height: MediaQuery.sizeOf(context).height * .15,
                            imageUrl: AppCubit.get(context).allFavorite[index]['image'],
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

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

        }
    );
  }
}
