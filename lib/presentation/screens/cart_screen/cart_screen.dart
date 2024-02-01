import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Center(
          child: Text('CartScreen',style: TextStyle(
              color: Colors.red,
              fontSize: 30
          ),),
        )
    );
  }
}
