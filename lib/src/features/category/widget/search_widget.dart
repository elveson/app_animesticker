import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 54,
          decoration: BoxDecoration(
            color: ColorsConstantsLight.colorGrayLight,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const TextField(
            // onTapOutside: (_) => context.unfocus(),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16.5,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search anime',
              hintStyle: TextStyle(
                fontFamily: FontConstants.fontFamily,
                fontSize: 16,
                letterSpacing: -0.32,
                color: ColorsConstantsLight.subtle2,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                color: ColorsConstantsLight.colorPrimary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const ImageIcon(
                AssetImage('assets/icons/search.png'),
                color: ColorsConstantsLight.colorGrayLight,
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
