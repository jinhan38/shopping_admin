import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping_admin/navigation/res/navigation_page.dart';
import 'package:shopping_admin/res/button.dart';
import 'package:shopping_admin/res/divider.dart';
import 'package:shopping_admin/res/style.dart';

class Menu extends StatelessWidget {
  bool expand;
  NavigationPage page;
  Function(NavigationPage page) onTap;
  Function(bool expand) onTapArrow;

  Menu({
    required this.expand,
    required this.page,
    required this.onTap,
    required this.onTapArrow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Stack(
        children: [
          if (expand) ...[
            Column(
              children: [
                 Container(
                  alignment: Alignment.center,
                  height: 100,
                  child: Text("메뉴", style: Style.title1),
                ),
                _menuItem("제품", page == NavigationPage.product,
                    () => onTap(NavigationPage.product)),
                const SizedBox(height: 10),
                _menuItem("이벤트", page == NavigationPage.event,
                    () => onTap(NavigationPage.event)),
                const SizedBox(height: 10),
                _menuItem("주문", page == NavigationPage.order,
                    () => onTap(NavigationPage.order)),
              ],
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: expand ? 10 : 0,
              child: expandableArrow(expand),
            ),
          ] else ...[
            Center(child: expandableArrow(expand)),
          ],
        ],
      ),
    );
  }

  Widget _menuItem(String text, bool selected, Function onTap) {
    return Container(
      color: selected ? Colors.orange : Colors.transparent,
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        autofocus: false,
        onPressed: () => onTap(),
        style: Button.outlineNormal,
        child: Text(text, style: selected ? Style.title3 : Style.body2),
      ),
    );
  }

  Widget expandableArrow(bool expand) {
    Widget icon = expand
        ? const Icon(Icons.arrow_back_ios_rounded, size: 16)
        : const Icon(Icons.arrow_forward_ios_rounded, size: 16);

    return GestureDetector(
      onTap: () {
        onTapArrow(!expand);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: icon,
      ),
    );
  }
}
