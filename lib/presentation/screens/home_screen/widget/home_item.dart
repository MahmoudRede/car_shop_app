import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/presentation/screens/cart_screen/widgets/cancel_button.dart';
import 'package:shop_car/presentation/screens/cart_screen/widgets/counter_buttons.dart';
import '../../../../styles/colors/color_manager.dart';

class HomeItem extends StatelessWidget {
  int index;

  HomeItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              Image.asset(
                "assets/images/product_image.png",
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height * .15,
              ),

              // Name of product
              Text("موتور تويوتا كامري، 2020",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: MediaQuery.sizeOf(context).height * .02,
                ),
                textAlign: TextAlign.end,
              ),

              SizedBox(height: MediaQuery.sizeOf(context).height * .01,),
              // description of product
              Text(
                "محتوى تجريبي عن وصف المنتج ومكوناته",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: ColorManager.grey,
                ),
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis
                ,),

              SizedBox(height: MediaQuery.sizeOf(context).height * .01,),

              // Total price and number of items
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Text(
                    "متبقى : ",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!.copyWith(
                      fontSize: MediaQuery.sizeOf(context).height * .012,
                    ),
                  ),
                  Text(
                    "8 قطع",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: MediaQuery.sizeOf(context).height * .01,
                    ),
                  ),

                  const Spacer(),

                  Text(
                    "SR ",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: MediaQuery.sizeOf(context).height * .012,
                    ),
                  ),
                  Text(
                    "3500",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(
                        fontSize: MediaQuery.sizeOf(context).height * .02,
                        color: ColorManager.secondaryColor
                            .withOpacity(.9),
                        fontWeight: FontWeight.bold),
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
