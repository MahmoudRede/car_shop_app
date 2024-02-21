import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_car/presentation/screens/favorite_screen/widget/favorite_item.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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

              SizedBox(height: MediaQuery.sizeOf(context).height*.06,),

              Text('المفضلة',style: TextStyle(
                  color: ColorManager.white,
                  fontSize: MediaQuery.sizeOf(context).height*.027,
                  fontWeight: FontWeight.bold
              ),),

              SizedBox(height: MediaQuery.sizeOf(context).height*.01,),

              Expanded(
                child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height*.02
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFEBECF0),
                          ColorManager.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),

                    child:ListView.separated(
                       padding: EdgeInsets.only(
                         top: MediaQuery.sizeOf(context).height*.02,
                       ),
                        itemBuilder: (context, index) {
                          return FavoriteItem(index: index,);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height * .001,
                          );
                        },
                        itemCount: 7
                    ),
                ),
              )
            ]
        ),
      ),
    );
  }
}
