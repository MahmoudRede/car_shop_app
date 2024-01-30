import 'package:flutter/material.dart';
import '../../core/local/cash_helper.dart';
import '../../styles/colors/color_manager.dart';

Future<dynamic> languageBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: ColorManager.primaryColor,
      context: context,
      builder: (context) {
        return Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height * .15,
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                           "arabic",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: ColorManager.white,
                                  fontSize: 17.0,
                                ),
                          ),
                          (CashHelper.getData(key: CashHelper.languageKey)
                                      .toString() ==
                                  'ar')
                              ? const Icon(
                                  Icons.check,
                                  color: ColorManager.white,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "english",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                              color: ColorManager.white,

                              fontSize: 17.0,
                                ),
                          ),
                          (CashHelper.getData(key: CashHelper.languageKey)
                                      .toString() ==
                                  'en')
                              ? const Icon(Icons.check,
                            color: ColorManager.white,
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ]));
      });
}
