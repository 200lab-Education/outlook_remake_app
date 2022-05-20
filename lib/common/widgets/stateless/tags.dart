import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outlook/common/widgets/stateless/tag_item.dart';
import 'package:outlook/themes/app_colors.dart';
import 'package:outlook/themes/constants.dart';
import 'package:outlook/utils/uidata.dart';

class Tags extends StatelessWidget {
  const Tags({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(UIData.icAngleDown, width: 16),
            const SizedBox(width: kDefaultPadding / 4),
            SvgPicture.asset(UIData.icMarkup, width: 20),
            const SizedBox(width: kDefaultPadding / 2),
            Text(
              "Tags",
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: AppColors.kGrayColor),
            ),
            const Spacer(),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              minWidth: 40,
              onPressed: () {},
              child: const Icon(
                Icons.add,
                color: AppColors.kGrayColor,
                size: 20,
              ),
            )
          ],
        ),
        const SizedBox(height: kDefaultPadding / 2),
        const TagItem(color: Color(0xFF23CF91), title: "Design"),
        const TagItem(color: Color(0xFF3A6FF7), title: "Work"),
        const TagItem(color: Color(0xFFF3CF50), title: "Friends"),
        const TagItem(color: Color(0xFF8338E1), title: "Family"),
      ],
    );
  }
}
