import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FileScreen extends StatelessWidget {
  const FileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Center(
          child: Text('FileScreen',style: TextStyle(
              color: Colors.red,
              fontSize: 30
          ),),
        )
    );
  }
}
