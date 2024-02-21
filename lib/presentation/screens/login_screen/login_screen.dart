import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/presentation/screens/home_layout/home_layout.dart';
import 'package:shop_car/presentation/screens/register_screen/register_screen.dart';
import 'package:shop_car/presentation/widgets/default_button.dart';
import 'package:shop_car/presentation/widgets/default_text_form_field.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class LoginScreen extends StatelessWidget {
  static var emailController = TextEditingController();
  static var passController = TextEditingController();
  static  GlobalKey<FormState> formKey = GlobalKey();

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is SignInWithFirebaseSuccessState) {
          emailController.clear();
          passController.clear();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeLayout(),
              ));
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Form(
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
                Expanded(
                  child: Image(
                    width: MediaQuery.sizeOf(context).height * .35,
                    image: const AssetImage('assets/images/car.png'),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.all(MediaQuery.sizeOf(context).height * .02),
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).height * .01),
                  height: MediaQuery.sizeOf(context).height * .55,
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
                          height: MediaQuery.sizeOf(context).height * .025,
                        ),
                        Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.sizeOf(context).height * .027,
                              color: ColorManager.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .03,
                        ),
                        DefaultTextFormField(
                            validateMessage: 'ادخل الايميل',
                            suffixImage: 'assets/images/mobile_icon.png',
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            hintText: 'رقم الجوال او الايميل'),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .04,
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
                          height: MediaQuery.sizeOf(context).height * .03,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'نسيت كلمة المرور ؟',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.sizeOf(context).height * .02,
                                  color: ColorManager.textColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .03,
                        ),
                        state is SignInWithFirebaseLoadingState
                            ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.secondaryColor,
                          ),
                        )
                            :DefaultButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.loginWithFirebaseAuth(
                                  email: emailController.text,
                                  password: passController.text);
                            }
                          },
                          backGroundColor: ColorManager.secondaryColor,
                          height: MediaQuery.sizeOf(context).height * .06,
                          width: double.infinity,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('دخول',
                                  style: TextStyle(
                                    color: ColorManager.textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.sizeOf(context).height *
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return const RegisterScreen();
                            }));
                          },
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'ليس لدي حساب',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.sizeOf(context).height * .022,
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
              ]),
            ),
          ),
        );
      },
    ));
  }
}
