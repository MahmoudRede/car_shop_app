
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/presentation/screens/start_screen/start_screen.dart';
import 'package:shop_car/styles/colors/color_manager.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Future.delayed(const Duration(seconds: 3),()async{

        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        const StartScreen()
        ), (Route<dynamic> route) => false);

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return Scaffold(
          body: Container(
            padding: EdgeInsets.zero,
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage('assets/images/splash_screen.png'),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: MediaQuery.sizeOf(context).height*.15,
                  image: const AssetImage('assets/images/logo.png'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
