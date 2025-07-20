import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:widgets/modules/favorite/view.dart';
import 'package:widgets/modules/home/view.dart';
import 'package:widgets/modules/menu/view.dart';
import 'package:widgets/modules/updates/view.dart';
import 'package:widgets/utilities/color.dart';

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
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(
                notchBottomBarController: _controller,
                kIconSize: 24,
                kBottomRadius: 0,
                removeMargins: true,
                showShadow: true,
                showLabel: false,
                shadowElevation: 0.3,
                durationInMilliSeconds: 300,
                itemLabelStyle: const TextStyle(fontSize: 10),
                bottomBarItems: const [
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.home_outlined,
                      color: AppColors.grey,
                    ),
                    activeItem: Icon(
                      Icons.home_outlined,
                      color: AppColors.primary,
                    ),
                    itemLabel: 'Home',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.newspaper,
                      color: AppColors.grey,
                    ),
                    activeItem: Icon(
                      Icons.newspaper,
                      color: AppColors.primary,
                    ),
                    itemLabel: 'Updates',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.book_outlined,
                      color: AppColors.grey,
                    ),
                    activeItem: Icon(
                      Icons.book_outlined,
                      color: AppColors.primary,
                    ),
                    itemLabel: 'Favorite',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.menu,
                      color: AppColors.grey,
                    ),
                    activeItem: Icon(
                      Icons.menu,
                      color: AppColors.primary,
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
      ),
    );
  }
}
