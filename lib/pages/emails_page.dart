import 'package:flutter/material.dart';
import 'package:outlook/common/widgets/stateless/email_card.dart';
import 'package:outlook/common/widgets/stateless/side_menu.dart';
import 'package:outlook/models/email.dart';
import 'package:outlook/pages/email_detail_page.dart';
import 'package:outlook/themes/app_colors.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:outlook/themes/constants.dart';
import 'package:outlook/utils/reponsive.dart';
import 'package:outlook/utils/uidata.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailsPage extends StatefulWidget {
  const EmailsPage({Key? key}) : super(key: key);

  @override
  _EmailsPageState createState() => _EmailsPageState();
}

class _EmailsPageState extends State<EmailsPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: const SideMenu(),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: AppColors.kBgDarkColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    // Once user click the menu icon the menu shows like drawer
                    // Also we want to hide this menu icon on desktop
                    if (!Responsive.isDesktop(context))
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                    if (!Responsive.isDesktop(context))
                      const SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          fillColor: AppColors.kBgLightColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(
                              kDefaultPadding * 0.75,
                            ), //15
                            child: SvgPicture.asset(
                              UIData.icSearch,
                              width: 16,
                              color: Colors.black,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.all(kDefaultPadding),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      UIData.icAngleDown,
                      width: 16,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Sort by date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: SvgPicture.asset(
                        UIData.icSort,
                        width: 16
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: emails.length,
                  // On mobile this active dosen't mean anything
                  itemBuilder: (context, index) => EmailCard(
                    isActive: Responsive.isMobile(context) ? false : index == 0,
                    email: emails[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EmailDetailPage(email: emails[index]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
