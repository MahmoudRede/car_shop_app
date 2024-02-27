import 'package:flutter/material.dart';
import 'package:shop_car/presentation/screens/brand_screen/brand_screen.dart';
import 'package:shop_car/presentation/screens/cart_screen/cart_screen.dart';
import 'package:shop_car/presentation/screens/files_screen/files_screen.dart';
import 'package:shop_car/presentation/screens/home_screen/home_screen.dart';
import 'package:shop_car/presentation/screens/profile_screen/profile_screen.dart';

String? uId;

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
    const FilesScreen(),
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
    '',
    'السله',
    'طلباتي',
    'البروفيل',
  ];

  static List<String> brandImages=[
    'assets/images/toyota-icon.png',
    'assets/images/nissan-icon.png',
    'assets/images/hyundai-icon.png',
    'assets/images/kia-icon.png',
    'assets/images/ford-icon.png',
    'assets/images/mercedes-icon.png',

  ];  static List<String> homeBrandImages=[
    'assets/icons/toyota-icon.svg',
    'assets/icons/nissan-icon.svg',
    'assets/icons/hyundai-icon.svg',
    'assets/icons/kia-icon.svg',
    'assets/icons/mercedes-benz-icon.svg',

  ];

  static List<String> homeBrandName=[
    'تويوتا',
    'نيسان',
    'هيونداي',
    'كيا',
     'ميرسيس',

  ];  static List<String> brandName=[
    'تويوتا',
    'نيسان',
    'هيونداي',
    'كيا',
    'فورد',
    'ميرسيس',

  ];
  static List<String> toyotaSubBrandImages=[
    'assets/images/crock.png',
    'assets/images/camri.png',
    'assets/images/romyon.png',
    'assets/images/corolla.png',
    'assets/images/yaris.png',
    'assets/images/folanshiner.png',
    'assets/images/folanshiner.png',
  ];
  static List<String> toyotaSubBrandName=[
    'كامري',
    'افلون',
    'لاندكروز',
    'كورلا',
    'لكزس RX350',
    'برادو',
    'هايلوكس',

  ];


  static List<String> camryStart = [
    '2004',
    '2007',
    '2007',
    '2013',
    '2015',
    '2018',
    '2018',
    '2018',
  ];

  static List<String> camryEnd = [
    '2006',
    '2009',
    '2011',
    '2020',
    '2017',
    '2020',
    '2022',
    '2023',
  ];

  static List<String> eflonStart =
  [ '1998',
    '2013',
    '2018',

  ];

  static List<String> eflonEnd = [
    '2022',
    '2018',
    '2020',
  ];

  static List<String> landStart = [
    '2005',
    '2008',
    '2008',
  ];

  static List<String> landEnd = [
    '2007',
    '2015',
    '2015',
  ];

  static List<String> croraStart = [
    '2005',
    '2008',
    '2011',
  ];

  static List<String> croraEnd = [
    '2007',
    '2013',
    '2013',
  ];

  static  List<String> lacsStart = [
    '2018',
  ];

  static List<String> lacsEnd = [
    '2020',
  ];

  static List<String> bordoStart = [
    '2003',

  ];

  static List<String> bordoEnd = [
    '2010',

  ];

  static List<String> holoxStart = [
    '2006',
    '2016',
  ];

  static List<String> holoxEnd = [
    '2015',
    '2020',
  ];

  static List<String> nissanSubBrandImages=[
    'assets/images/crock.png',
    'assets/images/camri.png',
    'assets/images/romyon.png',
    'assets/images/corolla.png',
    'assets/images/yaris.png',
    'assets/images/folanshiner.png',
    'assets/images/folanshiner.png',
  ];

  static List<String> nissanSubBrandName = [
    'التيما',
    'فيرسا',
    'روج',
    'نافارا',
    'سني هندي',
    'جوك',
    'سينترا',
  ];

 static List<String> timaStart = [
    '2013',
    '2013',
    '2019',
    '2019',
  ];

 static List<String> timaEnd = [
    '2018',
    '2015',
    '2021',
    '2022',
  ];

 static List<String> versaStart = [
    '2008',
    '2012',
    '2020',
  ];

 static List<String> versaEnd = [
    '2011',
    '2019',
    '2021',
  ];

 static List<String> rogStart = [
    '2017',
    '2021',
  ];

 static List<String> rogEnd = [
    '2020',
    '2023',
  ];

 static List<String> nafaraStart = [
    '2005',
    '2016',
  ];

 static List<String> nafaraEnd = [
    '2015',
    '2020',
  ];

static  List<String> sunnyStart = [
    '2013',
  ];

 static List<String> sunnyEnd = [
    '2021',
  ];

 static List<String> gocStart = [
    '2011',
    '2013',
    '2016',
  ];

 static List<String> gocEnd = [
    '2014',
    '2016',
    '2021',
  ];

 static List<String> syntraStart = [
    '2013',
    '2020',
  ];

 static List<String> syntraEnd = [
    '2019',
    '2021',
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
    "assets/icons/nissan-icon.svg",
    "assets/icons/toyota-icon.svg",
    "assets/icons/kia-icon.svg",
    "assets/icons/hyundai-icon.svg",
  ];


  static List<String> homeTabViewTitles=[
    'كامري',
    'كروك',
    'كورولا',
    'روميون',
    'فولاتشنر',
  ];

  static List<String> itemDetailsCarsImage = [
    'assets/images/car.png',
    'assets/images/carImage.png',
  ];
  static List<String> itemDetailsItemsImage = [
    'assets/images/product_image.png',
    'assets/images/product_image.png',
    'assets/images/product_image.png'
  ];



}