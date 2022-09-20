import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimention.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/material.dart';

import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimention.height45, bottom: Dimention.height15),
              padding: EdgeInsets.only(
                  left: Dimention.width20, right: Dimention.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Tunisia',
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'Gafsa',
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: Dimention.height45,
                    width: Dimention.height45,
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: Dimention.iconsize24,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimention.radius15),
                        color: AppColors.mainColor),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(child: FoodPageBody()),
          )
        ],
      ),
    );
  }
}
