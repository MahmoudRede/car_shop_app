import 'package:flutter/material.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback onTap;
   const CancelButton({required this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return                     Container(
      height: MediaQuery.sizeOf(context).height * .03,
      width: MediaQuery.sizeOf(context).width * .2,
      decoration: BoxDecoration(
          color: ColorManager.red,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                height: MediaQuery.sizeOf(context).height * .02,
                width: MediaQuery.sizeOf(context).height * .03,
                decoration:
                const BoxDecoration(
                    color: ColorManager.white,
                    shape: BoxShape.circle),
                child: Align(
                    child: Icon(
                      Icons.clear,
                      color: ColorManager.red,
                      size: MediaQuery.sizeOf(context).height*.02  ,
                    )),
              ),
            ),
            const Text(
              "إلغاء",
              style: TextStyle(color: ColorManager.white),
            ),
          ],
        ),
      ),
    );
  }
}
