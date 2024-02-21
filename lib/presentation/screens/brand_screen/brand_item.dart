import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../styles/colors/color_manager.dart';

class BrandItem extends StatelessWidget {
  final int index;
  final void Function()? onTap;

  const BrandItem({required this.onTap, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorManager.white,
            ),
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * .02),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      Constants.brandImages[index],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
