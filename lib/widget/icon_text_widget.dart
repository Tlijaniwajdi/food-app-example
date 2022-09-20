import 'package:e_commerce/utils/dimention.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  final Color iconcolor;
  const IconTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconcolor,
          size: Dimention.iconsize24,
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(text: text),
      ],
    );
  }
}
