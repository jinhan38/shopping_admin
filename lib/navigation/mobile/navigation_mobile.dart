import 'package:flutter/material.dart';
import 'package:shopping_admin/navigation/navigation_res.dart';

class NavigationMobile extends StatefulWidget {
  const NavigationMobile({Key? key}) : super(key: key);

  @override
  _NavigationMobileState createState() => _NavigationMobileState();
}

class _NavigationMobileState extends State<NavigationMobile> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndex,
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(child: _pages[value]),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => _currentIndex.value = index,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: value,
            items: List.generate(NavigationRes.baseIcons.length,
                (index) => _navigationBarItem(NavigationRes.baseIcons[index])),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _navigationBarItem(Icon icon) {
    return BottomNavigationBarItem(icon: icon, label: "");
  }

  final List<Widget> _pages = [
    Container(
      color: Colors.blue,
    ),
    Container(color: Colors.red),
    Container(color: Colors.purple),
  ];
}
