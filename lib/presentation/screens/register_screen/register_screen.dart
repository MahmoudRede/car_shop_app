import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/presentation/screens/home_layout/home_layout.dart';
import 'package:shop_car/presentation/screens/login_screen/login_screen.dart';
import 'package:shop_car/presentation/widgets/default_button.dart';
import 'package:shop_car/presentation/widgets/default_text_form_field.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class RegisterScreen extends StatelessWidget {
  static var emailController = TextEditingController();
  static var nameController = TextEditingController();
  static var phoneController = TextEditingController();
  static var townController = TextEditingController();
  static var passController = TextEditingController();
  static var formKey = GlobalKey<FormState>();

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is SignUpWithFirebaseSuccessState) {
          phoneController.clear();
          passController.clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeLayout(),
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            body: Form(
          key: formKey,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/splash_screen.png'),
              )),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .08,
                ),
                Image(
                  width: MediaQuery.sizeOf(context).height * .35,
                  image: const AssetImage('assets/images/car.png'),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .04,
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.all(MediaQuery.sizeOf(context).height * .02),
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height * .01),
                    height: MediaQuery.sizeOf(context).height * .68,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: ColorManager.lightColor2,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .015,
                          ),
                          Text(
                            'عميل جديد',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.sizeOf(context).height * .027,
                                color: ColorManager.textColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .025,
                          ),
                          DefaultTextFormField(
                              validateMessage: 'ادخل الاسم',
                              suffixImage: 'assets/images/user_icon.png',
                              controller: nameController,
                              textInputType: TextInputType.name,
                              hintText: 'الاسم'),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .025,
                          ),
                          DefaultTextFormField(
                            validateMessage: 'ادخل رقم الجوال',
                            suffixImage: 'assets/images/mobile_icon.png',
                            controller: phoneController,
                            textInputType: TextInputType.phone,
                            hintText: 'رقم الجوال',
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .025,
                          ),
                          DefaultTextFormField(
                            validateMessage: 'ادخل البريد الالكتروني',
                            suffixImage: 'assets/images/mail_icon.png',
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            hintText: 'البريد الالكتروني',
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .025,
                          ),
                          DefaultTextFormField(
                            validateMessage: 'ادخل المدينة',
                            suffixImage: 'assets/images/mobile_icon.png',
                            controller: townController,
                            textInputType: TextInputType.text,
                            hintText: 'المدينة',
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .025,
                          ),
                          DefaultTextFormField(
                            validateMessage: 'ادخل كلمه المرور',
                            suffixImage: 'assets/images/lock_icon.png',
                            controller: passController,
                            isPass: true,
                            textInputType: TextInputType.visiblePassword,
                            hintText: 'كلمة المرور',
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .015,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: ColorManager.grey,
                                  checkColor: ColorManager.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: ColorManager.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  value: cubit.isValue,
                                  onChanged: (v) {
                                    cubit.switchTerms(v!);
                                  }),
                              Text('أوافق على كافة الشروط والاحكام',
                                  style: TextStyle(color: ColorManager.grey)),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .01,
                          ),
                          state is SignUpWithFirebaseLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorManager.secondaryColor,
                                  ),
                                )
                              : DefaultButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.signUpWithFirebase(
                                          userName: nameController.text,
                                          email: emailController.text,
                                          phoneNumber: phoneController.text,
                                          city: townController.text,
                                          password: passController.text);
                                    }
                                  },
                                  backGroundColor: ColorManager.secondaryColor,
                                  height:
                                      MediaQuery.sizeOf(context).height * .06,
                                  width: double.infinity,
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('ارسال',
                                          style: TextStyle(
                                            color: ColorManager.textColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.sizeOf(context)
                                                    .height *
                                                .025,
                                          )),
                                      const Spacer(),
                                      const Image(
                                          image: AssetImage(
                                        'assets/images/arrow.png',
                                      ))
                                    ],
                                  ),
                                ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .03,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'لدي حساب بالفعل',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.sizeOf(context).height *
                                            .022,
                                    color: ColorManager.red,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ColorManager.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
      },
    );
  }
}
