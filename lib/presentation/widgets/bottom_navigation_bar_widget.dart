import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/styles/colors/color_manager.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
        builder: (context,state){
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height*.02
            ),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).height*.05
            ),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height*.08,
            decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(50)
            ),
            child: Row(
              children: [
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){

                            AppCubit.get(context).switchIconColor(index);

                          },
                          child: SvgPicture.asset(
                            Constants.bottomNavigationIcon[index],
                            height: MediaQuery.sizeOf(context).height*.025,
                            color: Constants.iconColors[index] ==false?  ColorManager.grey:ColorManager.secondaryColor,
                          ),
                        );
                      },
                      separatorBuilder: (context,index){
                        return SizedBox(width: MediaQuery.sizeOf(context).width/8.5,);
                      },
                      itemCount: Constants.bottomNavigationIcon.length
                  ),
                ),

              ],
            ),
          );
        },
    );
  }
}
