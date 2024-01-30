import 'package:flutter/material.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('assets/images/splash_screen.png'),
            )
        ),
        child: Column(
          children: [

            Expanded(
              child: Image(
                width: MediaQuery.sizeOf(context).height*.35,
                image: const AssetImage('assets/images/car.png'),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height*.01
              ),
              height: MediaQuery.sizeOf(context).height*.45,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: ColorManager.lightColor2,
              ),
              child: Column(
                children: [

                  SizedBox(height: MediaQuery.sizeOf(context).height*.03,),

                  Text('اختر اللغة المفضلة لك',style: TextStyle(
                     fontSize: MediaQuery.sizeOf(context).height*.027,
                     color: ColorManager.textColor,
                     fontWeight: FontWeight.bold
                  ),),

                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context,index){
                          return Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.sizeOf(context).height*.01,
                              right: MediaQuery.sizeOf(context).height*.01,
                              bottom: MediaQuery.sizeOf(context).height*.005
                            ),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorManager.white
                            ),
                            child:  Row(
                              children: [
                                Image(
                                  image: AssetImage(Constants.flags[index]),
                                  height: 20,
                                ),
                                const Spacer(),
                                Text(Constants.languages[index],style:  TextStyle(
                                  color: ColorManager.textColor,
                                  fontSize: MediaQuery.sizeOf(context).height*.02
                                ),)
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(height: MediaQuery.sizeOf(context).height*.02,),
                        itemCount: 3
                    ),
                  )
                ],
              ),
            )

          ]
        ),
      ),
    );
  }
}
