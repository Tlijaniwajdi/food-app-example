import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/controllers/popular_product_controller.dart';
import 'package:e_commerce/controllers/recommended_product_controller.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimention.dart';
import 'package:e_commerce/widget/app_column.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/icon_text_widget.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimention.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        GetBuilder<PopularProductController>(builder: (popproduct) {
          return popproduct.isLoaded
              ? Container(
                  //  color: Colors.red,
                  height: Dimention.pageView,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popproduct.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _BuildPageItem(
                            position, popproduct.popularProductList[position]);
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        // dots indicator ....
        GetBuilder<PopularProductController>(builder: (popprduct) {
          return DotsIndicator(
            dotsCount: popprduct.popularProductList.isEmpty
                ? 1
                : popprduct.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(
          height: Dimention.height30,
        ),
        // Popular text
        Container(
            margin: EdgeInsets.only(left: Dimention.width30),
            child: Row(
              children: [
                BigText(
                  text: 'Recommended',
                  color: Colors.black,
                ),
                SizedBox(
                  width: Dimention.width10,
                ),
                Container(
                  child: BigText(
                    text: '.',
                    color: Colors.black26,
                  ),
                ),
                SizedBox(
                  width: Dimention.width10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: 'Food pairing'),
                ),
              ],
            )),
        // list of food and images
        GetBuilder<RecommendedProductController>(builder: (recomproduct) {
          return recomproduct.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recomproduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: Dimention.width20,
                          right: Dimention.width20,
                          bottom: Dimention.height10),
                      child: Row(
                        children: [
                          // image section
                          Container(
                            height: Dimention.listViewImgSize,
                            width: Dimention.listViewImgSize,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimention.radius20),
                                color: Colors.white38,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.baseUrl +
                                        AppConstants.uploads +
                                        recomproduct
                                            .recommendedProductList[index]
                                            .img!))),
                          ),
                          // text container
                          Expanded(
                            child: Container(
                              height: Dimention.listViewTextContSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                      Dimention.radius20,
                                    ),
                                    bottomRight:
                                        Radius.circular(Dimention.radius20)),
                                color: Colors.white24,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: Dimention.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                        text: 'Nitirous Fruit meal in tunisia'),
                                    SizedBox(
                                      height: Dimention.height10,
                                    ),
                                    SmallText(
                                        text: 'with tunisien caracterstics'),
                                    SizedBox(
                                      height: Dimention.height10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconTextWidget(
                                          icon: Icons.circle_sharp,
                                          text: 'Normal',
                                          iconcolor: AppColors.iconColor1,
                                        ),
                                        IconTextWidget(
                                          icon: Icons.location_on,
                                          text: '1.5 km',
                                          iconcolor: AppColors.mainColor,
                                        ),
                                        IconTextWidget(
                                          icon: Icons.access_time_rounded,
                                          text: 'Normal',
                                          iconcolor: AppColors.iconColor2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        })
      ],
    );
  }

  Widget _BuildPageItem(int index, ProductModel popproduct) {
    Matrix4 matrix = new Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == (_currPageValue.floor() + 1)) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == (_currPageValue.floor() - 1)) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimention.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimention.width10, right: Dimention.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimention.raduis30),
                color: index.isEven ? Color(0xFF89dad0) : Color(0xFFfcab88),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.baseUrl +
                        AppConstants.uploads +
                        popproduct.img!))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimention.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimention.width30,
                  right: Dimention.width30,
                  bottom: Dimention.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimention.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5))
                ],
              ),
              child: AppColumn(
                text: popproduct.name!,
              ),
            ),
          )
        ],
      ),
    );
  }
}
