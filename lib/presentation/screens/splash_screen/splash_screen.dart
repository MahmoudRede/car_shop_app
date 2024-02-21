
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';

import '../../../core/local/cash_helper.dart';
import '../home_layout/home_layout.dart';
import '../login_screen/login_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),()async{

      AppCubit.get(context).getFavoriteProductFromApi().then((value) {
        CashHelper.getData(key: 'isUid') == null
            ? Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false)
            : {
           Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const HomeLayout()),
                  (Route<dynamic> route) => false)
        };
      });


    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
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
