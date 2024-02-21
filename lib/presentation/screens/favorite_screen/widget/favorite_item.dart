import 'package:flutter/material.dart';
import '../../../../styles/colors/color_manager.dart';

class FavoriteItem extends StatelessWidget {
  int index;

  FavoriteItem({required this.index, super.key});

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

              // item details
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Icon of favorite
                    const Icon(
                      Icons.favorite,
                      color: ColorManager.secondaryColor,
                    ),

                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .01,
                    ),

                    // Name of product
                    Expanded(
                      child: Text("موتور تويوتا كامري، 2020",
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontSize: MediaQuery.sizeOf(context).height * .027,
                          ),
                          textAlign: TextAlign.end,
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .01,
                    ),

                    // description of product
                    Text(
                      "محتوى تجريبي عن وصف المنتج ومكوناته",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: ColorManager.grey,
                      ),
                      textAlign: TextAlign.end,),


                    // Total price and number of items
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "3500",
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
                          "8 قطع",
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
                    Image.asset(
                      "assets/images/product_image.png",
                      fit: BoxFit.fitWidth,
                      height: MediaQuery.sizeOf(context).height * .15,
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
