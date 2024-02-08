import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/presentation/screens/notifications_screen/widgets/notification_item.dart';
import 'package:svg_flutter/svg.dart';
import '../../../styles/colors/color_manager.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: ColorManager.secondaryColor,
          weight: 2,
        ),
        title: Text(
          "الاشعارات",
          style: TextStyle(
              color: ColorManager.white,
              fontSize: MediaQuery.sizeOf(context).height * .027,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back(closeOverlays: true);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/splash_screen.png'),
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .1,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).height * .02,
                    vertical: MediaQuery.sizeOf(context).height * .01),
                height: MediaQuery.sizeOf(context).height * .85,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFEBECF0),
                      ColorManager.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Constants.notificationContent.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/empty.svg"),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * .02,
                            ),
                              Text(
                              "لا يوجد اشعارات",
                              style:
                                  Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(2),
                        itemBuilder: (context, index) {
                          return NotificationItem(
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
