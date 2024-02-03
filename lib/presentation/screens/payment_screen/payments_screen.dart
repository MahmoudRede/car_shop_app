import 'package:flutter/material.dart';
import 'package:shop_car/presentation/widgets/default_button.dart';
import 'package:shop_car/styles/colors/color_manager.dart';
import '../../../constants/constants.dart';
import '../cart_screen/widgets/confirm_paymnet_dialog.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody:  true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: ColorManager.secondaryColor,
          weight: 2,
        ),
        title: Text("اختر وسيلة الدفع",style: TextStyle(
            color: ColorManager.white,
            fontSize: MediaQuery.sizeOf(context).height*.027,
            fontWeight: FontWeight.bold
        ),),
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
              child:Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      padding: EdgeInsets.symmetric( horizontal: MediaQuery.sizeOf(context).height*.01, vertical: MediaQuery.sizeOf(context).width*.08),
                      crossAxisCount: 2,
                      childAspectRatio: 1/.7,
                      mainAxisSpacing: 20,
                      children: List.generate(Constants.paymentImages.length, (index) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15
                        ),
                        child: Material(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorManager.white,
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: MediaQuery.sizeOf(context).height*.01
                            ),
                            child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Constants.paymentImages[index],
                                  ),
                                  SizedBox( height: MediaQuery.sizeOf(context).height*.01,),
                                  index==6?Text("حوالة مالية", style: Theme.of(context).textTheme.headlineSmall):Container(),
                                  index==7?Text("الدفع عند الاستلام",style: Theme.of(context).textTheme.headlineSmall):Container(),

                                ]
                            ),
                          ),
                        ),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: DefaultButton(
                      onPressed: (){
                        confirmPaymentDialog(context);
                      },
                      backGroundColor: ColorManager.secondaryColor,
                      height: MediaQuery.sizeOf(context).height*.06,
                      width: double.infinity,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Image(
                              image: AssetImage(
                                'assets/images/arrow.png',
                              )
                          ),

                          Text('ادفع الان',style: TextStyle(
                            color: ColorManager.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.sizeOf(context).height*.025,
                          )),
                          Container(),

                        ],
                      ),),
                  ),
                  SizedBox( height: MediaQuery.sizeOf(context).height*.03,),

                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}
