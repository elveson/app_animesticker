import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsConstantsLight.colorGrayLight,
        child: Column(
          children: [
            Container(
              width: 294,
              height: 56,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      stops: [
                    0.075,
                    0.9512
                  ],
                      colors: [
                    Color(0xFFBA0000),
                    Color(0xFFFF3636),
                  ])),
              child: const Row(
                children: [
                  ListTile(
                    leading: SizedBox(
                      width: 24,
                      height: 24,
                      child: ImageIcon(
                        AssetImage('assets/icons/menu_left.png'),
                        size: 24,
                      ),
                    ),
                  ),
                  Text(
                    'Be Ottafan',
                    style: TextStyle(
                      fontFamily: FontConstants.fontFamily,
                      fontSize: 17,
                      letterSpacing: -0.408,
                      color: ColorsConstantsLight.colorGrayLight,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
