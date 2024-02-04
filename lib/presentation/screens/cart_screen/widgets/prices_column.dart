import 'package:flutter/material.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class PricesColumn extends StatelessWidget {
  const PricesColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          //  delivery price
          Container(
            height: MediaQuery.sizeOf(context).height * .08,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorManager.white.withOpacity(.9),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "17",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: ColorManager.black.withOpacity(.6),
                                ),
                      ),
                      Text(
                        "  SR",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: ColorManager.black.withOpacity(.6),
                                ),
                      ),
                    ],
                  ),
                  Row(children: [
                    VerticalDivider(
                      color: ColorManager.grey,
                      thickness: 1,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).height * .04,
                    ),
                    Text(
                      "قيمة التوصيل",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: ColorManager.black.withOpacity(.6),
                              ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .01,
          ),
          // addition price
          Container(
            height: MediaQuery.sizeOf(context).height * .08,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorManager.white.withOpacity(.9),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "3",
                        style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: ColorManager.black.withOpacity(.6),
                        ),
                      ),
                      Text(
                        "  SR",
                        style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: ColorManager.black.withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    VerticalDivider(
                      color: ColorManager.grey,
                      thickness: 1,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).height * .04,
                    ),
                    Text(
                      "القيمه المضافة",
                      style:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: ColorManager.black.withOpacity(.6),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .01,
          ),
          // total price
          Container(
            height: MediaQuery.sizeOf(context).height * .08,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorManager.white.withOpacity(.9),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "4400",
                        style:
                        Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: ColorManager.secondaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "  SR",
                        style:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: ColorManager.black.withOpacity(.6),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    VerticalDivider(
                      color: ColorManager.grey,
                      thickness: 1,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).height * .04,
                    ),
                    Text(
                      "الإجمالي المبلغ",
                      style:
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: ColorManager.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
