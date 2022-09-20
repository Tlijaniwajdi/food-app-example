import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimention.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/icon_text_widget.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimention.height15, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: text,
            color: Colors.black,
            size: Dimention.font26,
          ),
          SizedBox(height: Dimention.height10),
          Row(
            children: [
              Wrap(
                children: List.generate(
                    5,
                    (index) => Icon(
                          Icons.star,
                          size: 15,
                          color: AppColors.mainColor,
                        )),
              ),
              SizedBox(
                width: 10,
              ),
              SmallText(text: '5.5'),
              SizedBox(
                width: 10,
              ),
              SmallText(text: '1234 comments')
            ],
          ),
          SizedBox(
            height: Dimention.height10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          )
        ],
      ),
    );
  }
}
