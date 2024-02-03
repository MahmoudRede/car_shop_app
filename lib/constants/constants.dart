import 'package:flutter/material.dart';
import 'package:shop_car/presentation/screens/brand_screen/brand_screen.dart';
import 'package:shop_car/presentation/screens/cart_screen/cart_screen.dart';
import 'package:shop_car/presentation/screens/file_screen/file_screen.dart';
import 'package:shop_car/presentation/screens/home_screen/home_screen.dart';
import 'package:shop_car/presentation/screens/profile_screen/profile_screen.dart';

class Constants{

  static List<String> languages = [
    'العربية',
    'Kurdish',
    'English',
  ];

  static List<String> flags = [
    'assets/images/saudi.png',
    'assets/images/kurdi.png',
    'assets/images/english.png',
  ];

  static List<String> bottomNavigationIcon = [
    'assets/icons/car_icon.svg',
    'assets/icons/cart_icon.svg',
    'assets/icons/home_icon.svg',
    'assets/icons/file_icon.svg',
    'assets/icons/user_icon.svg',
  ];


  static List<Widget> screens=[
    const BrandScreen(),
    const CartScreen(),
    const HomeScreen(),
    const FileScreen(),
    const ProfileScreen(),
  ];

  static List<bool> iconColors=List.generate(5, (index) => false);

  static List<int> counter = List.generate(10, (index) => 1);


  static List<String> screensTitle=[
    'الماركات',
    'السله',
    'السله',
    'السله',
    'الماركات',
  ];

  static List<String> brandImages=[
    'assets/icons/kia-icon.svg',
    'assets/icons/ford-icon.svg',
    'assets/icons/toyota-icon.svg',
    'assets/icons/nissan-icon.svg',
    'assets/icons/hyundai-icon.svg',
    'assets/icons/mercedes-benz-icon.svg',
    'assets/icons/kia-icon.svg',
    'assets/icons/ford-icon.svg',
    'assets/icons/toyota-icon.svg',
    'assets/icons/nissan-icon.svg',
    'assets/icons/hyundai-icon.svg',
    'assets/icons/mercedes-benz-icon.svg',

  ];

  static List<String> paymentImages=[

    'assets/images/visa.png',
    'assets/images/stc.png',
    'assets/images/tamara.png',
    'assets/images/mada.png',
    'assets/images/apple_pay.png',
    'assets/images/tabby.png',
    'assets/images/bank_trans.png',
    'assets/images/on_delivery.png',

  ];


}