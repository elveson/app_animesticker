import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class ButtonAddSticker extends StatelessWidget {
  final String iconPath;
  final String label;
  const ButtonAddSticker(
      {super.key, required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorsConstantsLight.colorBlack.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorsConstantsLight.colorPrimary,
            ),
            child: ImageIcon(
              AssetImage(iconPath),
              color: ColorsConstantsLight.colorSurface,
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontFamily: FontConstants.fontFamily,
              fontSize: 11,
              letterSpacing: 0.066,
              color: ColorsConstantsLight.colorPrimary,
            ),
          )
        ],
      ),
    );
  }
}
