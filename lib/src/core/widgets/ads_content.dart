import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class AdsContent extends StatelessWidget {
  const AdsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorsConstantsLight.colorGrayDark,
      ),
    );
  }
}
