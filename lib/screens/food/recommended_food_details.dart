import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimention.dart';
import 'package:e_commerce/widget/app_icon.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 60,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimention.height10, bottom: Dimention.height10),
                child: Center(
                    child: BigText(
                  text: 'Have fun eating',
                  size: Dimention.font26,
                )),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimention.radius20),
                      topRight: Radius.circular(Dimention.radius20)),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.yellowAccent,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/food3.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimention.width20, right: Dimention.width20),
                  child: ExpandableTextWidget(
                      text:
                          'Fruit make up a large portion of our diets. Did you know many foods that we consider to be vegetables are actually fruits? The botanical definition of fruit is a seed-bearing part of a flowering plant or tree that can be eaten as food. By those standards, foods such as avocados, cucumbers, squash, and yes, even tomatoes are all fruits. From a culinary viewpoint, a fruit is usually thought of as any sweet-tasting plant product with seeds, whereas a vegetable is any savory or less sweet-tasting plant.Fruit make up a large portion of our diets. Did you know many foods that we consider to be vegetables are actually fruits? The botanical definition of fruit is a seed-bearing part of a flowering plant or tree that can be eaten as food. By those standards, foods such as avocados, cucumbers, squash, and yes, even tomatoes are all fruits. From a culinary viewpoint, a fruit is usually thought of as any sweet-tasting plant product with seeds, whereas a vegetable is any savory or less sweet-tasting plant.Fruit make up a large portion of our diets. Did you know many foods that we consider to be vegetables are actually fruits? The botanical definition of fruit is a seed-bearing part of a flowering plant or tree that can be eaten as food. By those standards, foods such as avocados, cucumbers, squash, and yes, even tomatoes are all fruits. From a culinary viewpoint, a fruit is usually thought of as any sweet-tasting plant product with seeds, whereas a vegetable is any savory or less sweet-tasting plant.'),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimention.width20 * 2.5,
              right: Dimention.width20 * 2.5,
              top: Dimention.height15,
              bottom: Dimention.height15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  iconsize: Dimention.iconsize24,
                  icon: Icons.remove,
                  iconcolor: Colors.white,
                  backgroundcolor: AppColors.mainColor,
                ),
                BigText(
                  text: 'DT12.88 ' + ' X ' + ' 0 ',
                  color: AppColors.mainBlackColor,
                  size: Dimention.font26,
                ),
                AppIcon(
                  iconsize: Dimention.iconsize24,
                  icon: Icons.add,
                  iconcolor: Colors.white,
                  backgroundcolor: AppColors.mainColor,
                ),
              ],
            ),
          ),
          Container(
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
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    )),
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
        ],
      ),
    );
  }
}
