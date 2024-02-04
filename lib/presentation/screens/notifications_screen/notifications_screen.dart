import 'package:flutter/material.dart';

import '../../../styles/colors/color_manager.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      extendBody:  true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: ColorManager.secondaryColor,
          weight: 2,
        ),
        title: Text("الاشعارات",style: TextStyle(
            color: ColorManager.white,
            fontSize: MediaQuery.sizeOf(context).height*.027,
            fontWeight: FontWeight.bold
        ),),
        leading: IconButton(onPressed: () {  }, icon: const Icon(Icons.arrow_back_ios_new,),) ,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('assets/images/splash_screen.png'),
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox( height: MediaQuery.sizeOf(context).height*.1,),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).height*.02,
                    vertical: MediaQuery.sizeOf(context).height*.01
                ),
                height: MediaQuery.sizeOf(context).height*.85,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
