import 'package:flutter/material.dart';
import 'package:outlook/themes/app_colors.dart';
import 'package:outlook/themes/constants.dart';
import 'package:outlook/utils/uidata.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'counter_badge.dart';

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key? key,
    required this.isActive,
    this.isHover = false,
    this.itemCount,
    this.showBorder = true,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  final bool isActive, isHover, showBorder;
  final int? itemCount;
  final String iconSrc;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: InkWell(
        onTap: press,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (isActive || isHover)
                ? SvgPicture.asset(UIData.icAngleRight, width: 15)
                : const SizedBox(width: 15),
            const SizedBox(width: kDefaultPadding / 4),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFE2EF)),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      iconSrc,
                      height: 20,
                      color: (isActive || isHover)
                          ? AppColors.kPrimaryColor
                          : AppColors.kGrayColor,
                    ),
                    const SizedBox(width: kDefaultPadding * 0.75),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: (isActive || isHover)
                                ? AppColors.kTextColor
                                : AppColors.kGrayColor,
                          ),
                    ),
                    const Spacer(),
                    if (itemCount != null) CounterBadge(count: itemCount!)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
