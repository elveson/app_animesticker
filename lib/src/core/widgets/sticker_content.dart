import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class StickerContent extends StatelessWidget {
  final bool isAmountSticker;
  final int widthSticker;
  final int heightSticker;
  const StickerContent({
    super.key,
    this.isAmountSticker = false,
    required this.widthSticker,
    required this.heightSticker,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: const DecorationImage(
            image: NetworkImage('https://source.unsplash.com/random/300x200'),
            fit: BoxFit.cover,
          ),
        ),
        child: isAmountSticker
            ? const Align(
                alignment: Alignment.center,
                child: Text(
                  '26',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.32,
                    color: ColorsConstantsLight.colorGrayLight,
                  ),
                ),
              )
            : null);
  }
}
