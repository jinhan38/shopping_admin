import 'package:flutter/material.dart';
import 'package:shopping_admin/navigation/desktop/navigation_desktop.dart';
import 'package:shopping_admin/responsive/responsive.dart';

import 'mobile/navigation_mobile.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Responsive(
              mobile: NavigationMobile(), desktop: NavigationDesktop())),
    );
  }
}
