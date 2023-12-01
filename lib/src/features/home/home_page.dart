import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/core/widgets/logo.dart';
import 'package:app_animesticker/src/features/home/widget/side_menu.dart';
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
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const ImageIcon(
              AssetImage('assets/icons/menu_left.png'),
              color: ColorsConstantsLight.colorText,
            ),
            tooltip: 'Menu de navegação',
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: const SideMenu(),
      // Drawer(
      //   elevation: 0,
      //   backgroundColor: ColorsConstantsLight.colorbackgoundMenu,
      //   child: ListView(
      //     children: [
      //       const SizedBox(
      //          height: 56,
      //       ),
      //       Container(
      //         decoration: const BoxDecoration(
      //           gradient: LinearGradient(
      //             begin: Alignment.centerRight,
      //             end: Alignment.centerLeft,
      //             stops: [0.075, 0.9512],
      //             colors: [
      //               Color(0xFFBA0000),
      //               Color(0xFFFF3636),
      //             ],
      //           ),
      //         ),
      //         child: ListTile(
      //           leading: const ImageIcon(
      //             AssetImage(
      //               'assets/icons/chess.png',
      //             ),
      //             color: ColorsConstantsLight.colorSurface,
      //           ),
      //           title: const Text(
      //             "Be Ottafan",
      //             style: TextStyle(
      //               fontFamily: FontConstants.fontFamily,
      //               fontSize: 17,
      //               letterSpacing: -0.408,
      //               color: ColorsConstantsLight.colorSurface,
      //             ),
      //           ),
      //           onTap: () {},
      //         ),
      //       ),
      //       const Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17.5),
      //         child: Text(
      //           'Follow Us',
      //           style: TextStyle(
      //             fontFamily: FontConstants.fontFamily,
      //             fontSize: 16,
      //             letterSpacing: -0.32,
      //             color: ColorsConstantsLight.subtle1,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: const ImageIcon(
      //           AssetImage('assets/icons/instagram.png'),
      //         ),
      //         title: const Text("Instagram"),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: const ImageIcon(
      //           AssetImage('assets/icons/tiktok.png'),
      //         ),
      //         title: const Text("TikTok"),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: const ImageIcon(
      //           AssetImage('assets/icons/world.png'),
      //         ),
      //         title: const Text("Ottamaker project"),
      //         onTap: () {},
      //       ),
      //       const Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17.5),
      //         child: Text(
      //           'App Info',
      //           style: TextStyle(
      //             fontFamily: FontConstants.fontFamily,
      //             fontSize: 16,
      //             letterSpacing: -0.32,
      //             color: ColorsConstantsLight.subtle1,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: const ImageIcon(
      //           AssetImage('assets/icons/more.png'),
      //         ),
      //         title: const Text("Collaborate"),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: const ImageIcon(
      //           AssetImage('assets/icons/category.png'),
      //         ),
      //         title: const Text("More apps"),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: const ImageIcon(
      //           AssetImage('assets/icons/bug.png'),
      //         ),
      //         title: const Text("Report a bug"),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: const ImageIcon(
      //           AssetImage('assets/icons/paper_privacy.png'),
      //         ),
      //         title: const Text("Terms of privacy"),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: const ImageIcon(
      //           AssetImage('assets/icons/paper_contract.png'),
      //         ),
      //         title: const Text("Terms of use"),
      //         onTap: () {},
      //       ),
      //     ],
      //   ),
      // ),
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
