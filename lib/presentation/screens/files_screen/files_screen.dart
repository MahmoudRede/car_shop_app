import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/presentation/screens/files_screen/widget/FileItem.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
      builder: (context,state){
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
                  //
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).height*.02
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFEBECF0),
                          ColorManager.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),

                    child:ListView.separated(
                        padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height*.02,
                        ),
                        itemBuilder: (context, index) {
                          return FilesItem(index: index,);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height * .001,
                          );
                        },
                        itemCount: AppCubit.get(context).cartList.length
                    ),
                  )
                  ,
                ),




              ],
            ),
          );
      },
    );
  }
}

