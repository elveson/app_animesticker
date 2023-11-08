import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class PackageIcon extends StatelessWidget {
  final String icon;
  final String namePackage;

  const PackageIcon({
    super.key,
    required this.icon,
    required this.namePackage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        color: ColorsConstantsLight.colorGrayMedium,
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(
          image: AssetImage('assets/packages/$namePackage/$icon'),
          // AssetImage('assets/packages/$namePackage/$icon'),
          // NetworkImage(
          //   'https://source.unsplash.com/random/300x200',
          // ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
