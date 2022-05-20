import 'package:flutter/material.dart';
import 'package:outlook/themes/app_colors.dart';
import 'package:outlook/themes/constants.dart';
import 'package:outlook/utils/uidata.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TagItem extends StatelessWidget {
  final Color color;
  final String title;

  const TagItem({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(kDefaultPadding * 1.5, 10, 0, 10),
        child: Row(
          children: [
            SvgPicture.asset(
              UIData.icMarkupFilled,
              height: 18,
              color: color,
            ),
            const SizedBox(width: kDefaultPadding / 2),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .button
              !.copyWith(color: AppColors.kGrayColor),
            ),
          ],
        ),
      ),
    );
  }
}
