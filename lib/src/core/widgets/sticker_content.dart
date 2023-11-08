import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class StickerContent extends StatelessWidget {
  final bool isAmountSticker;
  final int widthSticker;
  final int heightSticker;
  final String pathPackage;
  final String pathSticker;
  final String amountSticker;

  const StickerContent({
    super.key,
    this.isAmountSticker = false,
    required this.widthSticker,
    required this.heightSticker,
    required this.pathSticker,
    required this.pathPackage,
    this.amountSticker = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: isAmountSticker ? ColorsConstantsLight.colorBlack : null,
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage('assets/packages/$pathPackage/$pathSticker'),
          fit: BoxFit.cover,
          opacity: isAmountSticker ? 0.5 : 1,
        ),
      ),
      child: isAmountSticker
          ? Align(
              alignment: Alignment.center,
              child: Text(
                '+$amountSticker',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.32,
                  color: ColorsConstantsLight.colorGrayLight,
                ),
              ),
            )
          : null,
    );
  }
}
