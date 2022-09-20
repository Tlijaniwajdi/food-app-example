import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimention.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firsthalf;
  late String secondhalf;
  bool hiddentext = true;
  double textheight = Dimention.screenheight / 5.63;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textheight) {
      firsthalf = widget.text.substring(0, textheight.toInt());
      secondhalf =
          widget.text.substring(textheight.toInt() + 1, widget.text.length);
    } else {
      firsthalf = widget.text;
      secondhalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondhalf.isEmpty
          ? SmallText(
              text: firsthalf,
              size: Dimention.font16,
              color: AppColors.paraColor,
            )
          : Column(
              children: [
                SmallText(
                  text: hiddentext
                      ? (firsthalf + '....')
                      : (firsthalf + secondhalf),
                  size: Dimention.font16,
                  color: AppColors.paraColor,
                  height: 1.5,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddentext = !hiddentext;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: 'show more',
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddentext
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
