import 'package:flutter/material.dart';
import 'package:shopping_admin/navigation/desktop/menu.dart';
import 'package:shopping_admin/navigation/res/navigation_page.dart';

import '../../product/product_screen/product_screen.dart';

class NavigationDesktop extends StatelessWidget {
  NavigationDesktop({Key? key}) : super(key: key);
  final ValueNotifier<NavigationPage> _currentIndex =
      ValueNotifier(NavigationPage.product);
  final ValueNotifier<bool> _menuExpand = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentIndex,
      builder: (context, index, child) {
        return ValueListenableBuilder(
          valueListenable: _menuExpand,
          builder: (context, expand, child) {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Menu(
                      expand: expand,
                      page: index,
                      onTap: _changeCurrentIndex,
                      onTapArrow: (expand) => _menuExpand.value = expand),
                ),
                Expanded(flex: expand ? 5 : 15, child: _body(index)),
              ],
            );
          },
        );
      },
    );
  }

  _changeCurrentIndex(NavigationPage page) => _currentIndex.value = page;

  Widget _body(NavigationPage page) {
    return ProductScreen();
  }
}
