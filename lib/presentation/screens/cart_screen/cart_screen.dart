import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_car/presentation/screens/cart_screen/widgets/cart_item.dart';
import 'package:shop_car/presentation/screens/cart_screen/widgets/prices_column.dart';
import 'package:shop_car/presentation/screens/payment_screen/payments_screen.dart';
import 'package:shop_car/presentation/widgets/default_button.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .01,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height * .02),
            height: MediaQuery.sizeOf(context).height * .78,
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
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartItem(index: index,);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height * .001,
                        );
                      },
                      itemCount: 3),
                ),
                const PricesColumn(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: DefaultButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const PaymentScreen();
                      },));
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
                            ),
                        ),

                        Text('تأكيد الدفع',style: TextStyle(
                          color: ColorManager.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.sizeOf(context).height*.025,
                        )),

                      ],
                    ),),
                ),
                SizedBox( height: MediaQuery.sizeOf(context).height*.02,),
              ],
            ),
          ),




        ],
      ),
    );
  }
}
