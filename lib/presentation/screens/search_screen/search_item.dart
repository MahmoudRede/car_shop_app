import 'package:flutter/material.dart';
import '../../../../styles/colors/color_manager.dart';

class SearchItem extends StatelessWidget {
  int index;

  SearchItem({required this.index, super.key});

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

                  Text(
                    "SR",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: MediaQuery.sizeOf(context).height * .012,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "8 قطع",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: MediaQuery.sizeOf(context).height * .01,
                    ),
                  ),

                  Text(
                    " : متبقي ",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!.copyWith(
                      fontSize: MediaQuery.sizeOf(context).height * .012,
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
