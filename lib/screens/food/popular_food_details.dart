import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimention.dart';
import 'package:e_commerce/widget/app_column.dart';
import 'package:e_commerce/widget/app_icon.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/expandable_text_widget.dart';

import 'package:flutter/material.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        // background image
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            height: Dimention.popularFoodImgSize,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/food3.png'),
            )),
          ),
        ),
        // icon widget
        Positioned(
          top: Dimention.height45,
          left: Dimention.width20,
          right: Dimention.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.arrow_back_ios),
              AppIcon(icon: Icons.shopping_cart_outlined),
            ],
          ),
        ),
        // introduce of food
        Positioned(
          top: Dimention.popularFoodImgSize - 30,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.only(
                left: Dimention.width20,
                right: Dimention.width20,
                top: Dimention.height20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimention.radius20),
                  topRight: Radius.circular(Dimention.radius20),
                ),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppColumn(
                  text: 'Tunisien side',
                ),
                SizedBox(
                  height: Dimention.height20,
                ),
                BigText(text: 'Introduce'),
                SizedBox(
                  height: Dimention.height20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ExpandableTextWidget(
                        text:
                            'Fruit make up a large portion of our diets. Did you know many foods that we consider to be vegetables are actually fruits? The botanical definition of fruit is a seed-bearing part of a flowering plant or tree that can be eaten as food. By those standards, foods such as avocados, cucumbers, squash, and yes, even tomatoes are all fruits. From a culinary viewpoint, a fruit is usually thought of as any sweet-tasting plant product with seeds, whereas a vegetable is any savory or less sweet-tasting plant.Fruit make up a large portion of our diets. Did you know many foods that we consider to be vegetables are actually fruits? The botanical definition of fruit is a seed-bearing part of a flowering plant or tree that can be eaten as food. By those standards, foods such as avocados, cucumbers, squash, and yes, even tomatoes are all fruits. From a culinary viewpoint, a fruit is usually thought of as any sweet-tasting plant product with seeds, whereas a vegetable is any savory or less sweet-tasting plant.Fruit make up a large portion of our diets. Did you know many foods that we consider to be vegetables are actually fruits? The botanical definition of fruit is a seed-bearing part of a flowering plant or tree that can be eaten as food. By those standards, foods such as avocados, cucumbers, squash, and yes, even tomatoes are all fruits. From a culinary viewpoint, a fruit is usually thought of as any sweet-tasting plant product with seeds, whereas a vegetable is any savory or less sweet-tasting plant.'),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        height: Dimention.bottomheightbar,
        padding: EdgeInsets.only(
            top: Dimention.height30,
            bottom: Dimention.height30,
            left: Dimention.width20,
            right: Dimention.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimention.radius20 * 2),
              topRight: Radius.circular(Dimention.radius20 * 2),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimention.height20,
                  bottom: Dimention.height20,
                  left: Dimention.width20,
                  right: Dimention.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimention.radius20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimention.width10,
                  ),
                  BigText(text: '0'),
                  SizedBox(width: Dimention.width10),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ],
              ),
            ),
            Container(
              child: BigText(
                text: 'DT10 | Add to cart',
                color: Colors.white,
              ),
              padding: EdgeInsets.only(
                  top: Dimention.height20,
                  bottom: Dimention.height20,
                  left: Dimention.width20,
                  right: Dimention.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimention.radius20),
                color: AppColors.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
