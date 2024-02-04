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

  static List<bool> iconColors=[
    false,
    false,
    true,
    false,
    false,
  ];

  static List<int> counter = List.generate(10, (index) => 1);


  static List<String> screensTitle=[
    'الماركات',
    'السله',
    'السله',
    'السله',
    'البروفيل',
  ];

  static List<String> brandImages=[
    'assets/images/kia-icon.png',
    'assets/images/ford-icon.png',
    'assets/images/toyota-icon.png',
    'assets/images/nissan-icon.png',
    'assets/images/hyundai-icon.png',
    'assets/images/mercedes-icon.png',
    'assets/images/kia-icon.png',
    'assets/images/ford-icon.png',
    'assets/images/toyota-icon.png',
    'assets/images/nissan-icon.png',
    'assets/images/hyundai-icon.png',
    'assets/images/mercedes-icon.png',
    'assets/images/kia-icon.png',
    'assets/images/ford-icon.png',
    'assets/images/toyota-icon.png',
    'assets/images/nissan-icon.png',
    'assets/images/hyundai-icon.png',
    'assets/images/mercedes-icon.png',
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

  static List<String> typeImages=[
    'assets/images/store1.png',
    'assets/images/store2.png',
    'assets/images/store3.png',
    'assets/images/store4.png',
    'assets/images/store5.png',
    'assets/images/store6.png',
  ];

  static List<String> typeNamed=[
    'صينى',
    'كوري',
    'تيواني',
    'يباني',
    'تايلاندي',
    'ماليزي',
  ];

  static List<String> profileImages=[
    'assets/images/user_icon.png',
    'assets/images/notification.png',
    'assets/images/translate.png',
    'assets/images/heart.png',
    'assets/images/call.png',
    'assets/images/share.png',
    'assets/images/arrow-back.png',
  ];

  static List<String> profileTitles=[
    'بياناتي',
    'الاشعارات',
    'اللغة',
    'المفضلة',
    'اتصل بنا',
    'شارك التطبيق',
    'تسجيل الخروج',
  ];

  static List<String> notificationIons=[
     'assets/icons/notification_order.svg',
     'assets/icons/notification_location.svg',
     'assets/icons/notification_discount.svg',
  ];

  static List<String> notificationContent=[];


  static List<String> brandsImagesSvg = [
    "assets/icons/kia-icon.svg",
    "assets/icons/toyota-icon.svg",
    "assets/icons/nissan-icon.svg",
    "assets/icons/hyundai-icon.svg",
  ];


  static List<String> homeTabViewTitles=[
    'كامري',
    'كروك',
    'كورولا',
    'روميون',
    'فولاتشنر',
  ];



}