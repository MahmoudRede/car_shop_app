import 'package:flutter/material.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/styles/colors/color_manager.dart';
import 'package:svg_flutter/svg_flutter.dart';

class NotificationItem extends StatelessWidget {
  int index;

  NotificationItem({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: MediaQuery.sizeOf(context).height * .1,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.sizeOf(context).height * .09,
                width: MediaQuery.sizeOf(context).width * .15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0
                      ? ColorManager.primaryColor
                      : index == 1
                          ? ColorManager.lightBlue
                          : ColorManager.secondaryColor,
                ),
                child: SvgPicture.asset(
                  Constants.notificationIons[index],
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
              SizedBox(
              width: MediaQuery.sizeOf(context).width*.02,
            ),
            Expanded(
              flex: 3,
              child: Text(
                "العنوان الخاص بالاشعار المرسل والموجود الان جزء مختصر منه",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "${DateTime.now().hour}:${DateTime.now().minute + DateTime.now().second} ",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
