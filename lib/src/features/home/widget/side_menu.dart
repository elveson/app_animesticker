import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 294,
      backgroundColor: ColorsConstantsLight.colorbackgoundMenu,
      child: ListView(
        children: [
          const SizedBox(
            height: 56,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                stops: [0.075, 0.9512],
                colors: [
                  Color(0xFFBA0000),
                  Color(0xFFFF3636),
                ],
              ),
            ),
            child: ListTile(
              leading: const ImageIcon(
                AssetImage(
                  'assets/icons/chess.png',
                ),
                color: ColorsConstantsLight.colorSurface,
              ),
              title: const Text(
                "Be Ottafan",
                style: TextStyle(
                  fontFamily: FontConstants.fontFamily,
                  fontSize: 17,
                  letterSpacing: -0.408,
                  color: ColorsConstantsLight.colorSurface,
                ),
              ),
              onTap: () {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17.5),
            child: Text(
              'Follow Us',
              style: TextStyle(
                fontFamily: FontConstants.fontFamily,
                fontSize: 16,
                letterSpacing: -0.32,
                color: ColorsConstantsLight.subtle1,
              ),
            ),
          ),
          ListTile(
            leading: const ImageIcon(
              AssetImage('assets/icons/instagram.png'),
            ),
            title: const Text("Instagram"),
            onTap: () {},
          ),
          ListTile(
            leading: const ImageIcon(
              AssetImage('assets/icons/tiktok.png'),
            ),
            title: const Text("TikTok"),
            onTap: () {},
          ),
          ListTile(
            leading: const ImageIcon(
              AssetImage('assets/icons/world.png'),
            ),
            title: const Text("Ottamaker project"),
            onTap: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17.5),
            child: Text(
              'App Info',
              style: TextStyle(
                fontFamily: FontConstants.fontFamily,
                fontSize: 16,
                letterSpacing: -0.32,
                color: ColorsConstantsLight.subtle1,
              ),
            ),
          ),
          ListTile(
            leading: const ImageIcon(
              AssetImage('assets/icons/more.png'),
            ),
            title: const Text("Collaborate"),
            onTap: () {},
          ),
          ListTile(
            leading: const ImageIcon(
              AssetImage('assets/icons/category.png'),
            ),
            title: const Text("More apps"),
            onTap: () {},
          ),
          ListTile(
            leading: const ImageIcon(
              AssetImage('assets/icons/bug.png'),
            ),
            title: const Text("Report a bug"),
            onTap: () {},
          ),
          ListTile(
            leading: const ImageIcon(
              AssetImage('assets/icons/paper_privacy.png'),
            ),
            title: const Text("Terms of privacy"),
            onTap: () {},
          ),
          ListTile(
            leading: const ImageIcon(
              AssetImage('assets/icons/paper_contract.png'),
            ),
            title: const Text("Terms of use"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
