import 'package:flutter/material.dart';
import 'package:shopping_admin/home/home_desktop.dart';
import 'package:shopping_admin/home/home_mobile.dart';
import 'package:shopping_admin/responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("앱바"),
      ),
      body: Responsive(mobile: HomeMobile(), desktop: HomeDesktop()),
    );
  }
}
