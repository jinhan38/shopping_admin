import 'package:flutter/material.dart';
import 'package:shopping_admin/res/button.dart';

import '../product_register/product_register.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            _tabBar(),
            Expanded(child: _tabBarView()),
          ],
        ));
  }

  Widget _tabBar() {
    return TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey.shade600,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Colors.black,
      overlayColor: Button.getColor(Colors.grey.shade100, Colors.grey),
      tabs: const [
       Tab(text: "목록"),
       Tab(text: "등록"),
      ],
    );
  }

  Widget _tabBarView() {
    return TabBarView(children: [
      Container(
        color: Colors.red,
      ),
      ProductRegister(),
    ]);
  }
}
