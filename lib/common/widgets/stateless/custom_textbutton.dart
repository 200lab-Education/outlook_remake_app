import 'package:flutter/material.dart';
import 'package:outlook/common/widgets/neumorphism.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outlook/themes/app_colors.dart';
import 'package:outlook/themes/constants.dart';

class CustomTextButton extends StatelessWidget {
  final String textBtn;
  final Color? textColor;
  final String icSrc;
  final Color bgColor;
  final VoidCallback onTapBtn;

  const CustomTextButton({
    Key? key,
    required this.textBtn,
    required this.icSrc,
    required this.bgColor,
    required this.onTapBtn,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          bgColor,
        ),
        textStyle: MaterialStateProperty.all<TextStyle?>(
          Theme.of(context).textTheme.subtitle1,
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: kDefaultPadding),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder?>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: onTapBtn,
      icon: SvgPicture.asset(
        icSrc,
        width: 16
      ),
      label: Text(
        textBtn,
        style: TextStyle(color: textColor ?? AppColors.kTextColor),
      ),
    ).addNeumorphism();
  }
}
