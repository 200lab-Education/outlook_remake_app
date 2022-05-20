import 'package:flutter/material.dart';
import 'package:outlook/common/widgets/stateless/side_menu.dart';
import 'package:outlook/models/email.dart';
import 'package:outlook/pages/email_detail_page.dart';
import 'package:outlook/pages/emails_page.dart';
import 'package:outlook/utils/reponsive.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: const EmailsPage(),
        tablet: Row(
          children: [
            const Expanded(
              flex: 6,
              child: EmailsPage(),
            ),
            Expanded(
              flex: 9,
              child: EmailDetailPage(email: emails[0],),
            ),
          ],
        ),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child:const SideMenu(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child:const EmailsPage(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child:EmailDetailPage(email: emails[0],),
            ),
          ],
        ),
      ),
    );
  }
}
