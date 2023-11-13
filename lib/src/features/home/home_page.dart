import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/core/widgets/logo.dart';
import 'package:app_animesticker/src/core/widgets/side_menu.dart';
import 'package:app_animesticker/src/features/category/category_page.dart';
import 'package:app_animesticker/src/features/feed/feed_page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    const FeedPage(),
    const CategoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Logo(),
        actions: <Widget>[
          IconButton(
            icon: const ImageIcon(
              AssetImage('assets/icons/share.png'),
              color: ColorsConstantsLight.colorPurple,
            ),
            tooltip: 'Shared',
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const ImageIcon(
            AssetImage('assets/icons/menu_left.png'),
            color: ColorsConstantsLight.colorText,
          ),
          tooltip: 'Menu de navegação',
          onPressed: () {},
        ),
      ),
      // drawer: const SideMenu(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/home.png')),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/search.png')),
            label: 'Category',
          ),
        ],
        elevation: 4,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
