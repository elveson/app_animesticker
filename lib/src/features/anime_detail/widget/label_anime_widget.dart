import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class LabelAnimeWidget extends StatelessWidget {
  final String textLabel;

  const LabelAnimeWidget({super.key, required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ColorsConstantsLight.colorGrayLight,
      ),
      child: Text(
        textLabel,
        style: const TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorsConstantsLight.colorText,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
