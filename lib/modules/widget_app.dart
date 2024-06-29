import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:widgets/modules/favorite/view.dart';
import 'package:widgets/modules/home/view.dart';
import 'package:widgets/modules/menu/view.dart';
import 'package:widgets/modules/updates/view.dart';

class WidgetApp extends StatefulWidget {
  const WidgetApp({super.key});

  @override
  State<WidgetApp> createState() => _WidgetAppState();
}

class _WidgetAppState extends State<WidgetApp> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      HomePage(),
      UpdatesPage(), 
      FavoritePage(), 
      MenuPage(),
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              showLabel: true,
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              notchColor: Colors.white,
              kIconSize: 24,
              kBottomRadius: 15,
              shadowElevation: 2,
              durationInMilliSeconds: 300,
              itemLabelStyle: const TextStyle(fontSize: 10),
              elevation: 1,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.newspaper,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.newspaper,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Updates',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.favorite,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.favorite,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Favorite',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.menu,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.menu,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Menu',
                ),
              ],
              onTap: (index) {
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}
