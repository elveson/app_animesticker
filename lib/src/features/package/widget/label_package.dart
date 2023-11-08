import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class LabelPackage extends StatelessWidget {
  final String textLabel;
  const LabelPackage({super.key, required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ColorsConstantsLight.colorGrayLight,
      ),
      child: Center(
        child: Text(
          textLabel,
          style: const TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: ColorsConstantsLight.colorText,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
