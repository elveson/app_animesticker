import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Ottamaker ',
        style: TextStyle(
          fontFamily: FontConstants.fontFamily,
          color: ColorsConstantsLight.colorText,
        ),
        children: [
          TextSpan(
            text: 'Beta',
            style: TextStyle(
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              color: ColorsConstantsLight.subtle2,
            ),
          ),
        ],
      ),
      // children: const [
      //   Text(
      //     'Ottamaker ',
      //     style: TextStyle(
      //       fontFamily: FontConstants.fontFamily,
      //       color: ColorsConstantsLight.colorText,
      //     ),
      //   ),
      // ],
    );
  }
}
