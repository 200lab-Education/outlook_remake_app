import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:outlook/common/widgets/stateless/custom_textbutton.dart';
import 'package:outlook/common/widgets/stateless/side_menu_item.dart';
import 'package:outlook/common/widgets/stateless/tags.dart';
import 'package:outlook/themes/app_colors.dart';
import 'package:outlook/themes/constants.dart';
import 'package:outlook/utils/reponsive.dart';
import 'package:outlook/utils/uidata.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 10),
      color: AppColors.kBgLightColor,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Image.asset(UIData.logoOutlook, width: 46),
                  const Spacer(),
                  // We don't want to show this close button on Desktop mood
                  if (!Responsive.isDesktop(context)) const CloseButton(),
                ],
              ),
              const SizedBox(height: kDefaultPadding),
              CustomTextButton(
                textBtn: 'New messages',
                bgColor: AppColors.kPrimaryColor,
                icSrc: UIData.icEdit,
                onTapBtn: () {},
                  textColor:  Colors.white,
              ),
              const SizedBox(height: kDefaultPadding),
              CustomTextButton(
                textBtn: 'Get messages',
                bgColor: AppColors.kBgDarkColor,
                icSrc: UIData.icDownload,
                onTapBtn: () {},
              ),
              const SizedBox(height: kDefaultPadding * 2),
              // Menu Items
              SideMenuItem(
                press: () {},
                title: "Inbox",
                iconSrc: UIData.icInbox,
                isActive: true,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {},
                title: "Sent",
                iconSrc: UIData.icSend,
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Drafts",
                iconSrc: UIData.icFile,
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Deleted",
                iconSrc: UIData.icTrash,
                isActive: false,
                showBorder: false,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              // Tags
              const Tags(),
            ],
          ),
        ),
      ),
    );
  }
}
