import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_car/business_logic/app_cubit/app_cubit.dart';
import 'package:shop_car/business_logic/app_cubit/app_states.dart';
import 'package:shop_car/constants/constants.dart';
import 'package:shop_car/styles/colors/color_manager.dart';

class CounterButtons extends StatelessWidget {
  int index;
    CounterButtons({ required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
   },
  builder: (context, state) {
    var cubit=AppCubit.get(context);
    return Container(
      height: MediaQuery.sizeOf(context).height * .04,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: ColorManager.grey.withOpacity(.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              cubit.decreaseCartCounter( index );
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * .04,
              width: MediaQuery.sizeOf(context).width * .08,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                color: Colors.blue.withOpacity(.1)
              ),
              child: Icon(Icons.remove,
                size: MediaQuery.sizeOf(context).height * .025,
                color: ColorManager.black.withOpacity(.7),
              ),
            ),
          ),
          Text("${Constants.counter}",style:  Theme.of(context).textTheme.headlineSmall,),
          InkWell(
            onTap: (){
              cubit.increaseCartCounter(index );
            } ,
            child: Container(
              height: MediaQuery.sizeOf(context).height * .04,
              width: MediaQuery.sizeOf(context).width * .08,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                  color: Colors.blue.withOpacity(.1)
              ),
              child: Icon(Icons.add,
              size: MediaQuery.sizeOf(context).height * .025,
              color: ColorManager.black.withOpacity(.7),
              ),

            ),
          ),

        ]
      )
    );
  },
);
  }
}
