import 'package:flutter/material.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/presentation/screens/home_layout/home_layout.dart';
import 'package:shop_car/styles/colors/color_manager.dart';
import 'package:svg_flutter/svg.dart';

Future<dynamic> confirmPaymentDialog(BuildContext context) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/confirm_payment.svg',
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .02,
            ),
            Text(
              "لقد تم الدفع بنجاح",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              AppCubit.get(context).currentIndex=2;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomeLayout();
                  },
                ),
              );
            },
            child: Center(
              child: Container(
                  height: MediaQuery.sizeOf(context).height * .08,
                  width: MediaQuery.sizeOf(context).width * .2,
                  decoration: const BoxDecoration(
                    color: ColorManager.secondaryColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/home_icon.svg',
                      color: ColorManager.white,
                    ),
                  ),),
            ),
          )
        ],
      );
    },
  );
}
