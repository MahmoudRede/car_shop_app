import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/presentation/screens/cart_screen/widgets/cancel_button.dart';
import '../../../../styles/colors/color_manager.dart';

class CartItem extends StatelessWidget {
  int index;

  CartItem({required this.index, super.key});

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Row contains the cancel button and the order number
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CancelButton(onTap: () {

                          }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .01,
                    ),
                    // Text of brand name
                    Expanded(
                      child: Text(AppCubit.get(context).allFavorite[index]["name"],
                          style: Theme.of(context).textTheme.headlineMedium),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .01,
                    ),
                    // Row contains the seller name
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          AppCubit.get(context).allFavorite[index]['address'],
                        ),
                      ],
                    ),

                    // Time of order
                     SizedBox(
                      height: MediaQuery.sizeOf(context).height * .02,
                    ),
                    // Total price
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
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .03,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    //
                    CachedNetworkImage(
                      imageUrl:
                      '${AppCubit.get(context).allFavorite[index]['image']}',
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
                    const Spacer(),
                    BlocConsumer<AppCubit, AppStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return Container(
                            height: MediaQuery.sizeOf(context).height * .04,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: ColorManager.grey.withOpacity(.5),
                              ),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      AppCubit.get(context)
                                          .decreaseCartCounter( index );
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              .04,
                                      width: MediaQuery.sizeOf(context).width *
                                          .065,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20)),
                                          color: Colors.blue.withOpacity(.1)),
                                      child: Icon(
                                        Icons.remove,
                                        size:
                                            MediaQuery.sizeOf(context).height *
                                                .025,
                                        color:
                                            ColorManager.black.withOpacity(.7),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${Constants.counter[index]}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      AppCubit.get(context)
                                          .increaseCartCounter( index );
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              .04,
                                      width: MediaQuery.sizeOf(context).width *
                                          .065,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20)),
                                          color: Colors.blue.withOpacity(.1)),
                                      child: Icon(
                                        Icons.add,
                                        size:
                                            MediaQuery.sizeOf(context).height *
                                                .025,
                                        color:
                                            ColorManager.black.withOpacity(.7),
                                      ),
                                    ),
                                  ),
                                ],),);
                      },
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
}
