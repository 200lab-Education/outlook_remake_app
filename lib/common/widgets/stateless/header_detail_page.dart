import 'package:flutter/material.dart';
import 'package:outlook/themes/constants.dart';
import 'package:outlook/utils/reponsive.dart';
import 'package:outlook/utils/uidata.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderDetailPage extends StatelessWidget {
  const HeaderDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          // We need this back button on mobile, desktop
          if (Responsive.isMobile(context))
            const BackButton(),
          IconButton(
            icon: SvgPicture.asset(
              UIData.icTrash,
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              UIData.icReply,
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              UIData.icReplyAll,
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              UIData.icTransfer,
              width: 24,
            ),
            onPressed: () {},
          ),
          const Spacer(),
          // We don't need print option on mobile
          if (Responsive.isDesktop(context))
            IconButton(
              icon: SvgPicture.asset(
                UIData.icPrinter,
                width: 24,
              ),
              onPressed: () {},
            ),
          IconButton(
            icon: SvgPicture.asset(
              UIData.icMarkup,
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              UIData.icMoreVertical,
              width: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
