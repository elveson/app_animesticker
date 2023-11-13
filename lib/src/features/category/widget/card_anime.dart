import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/core/widgets/card_photo_anime.dart';
import 'package:app_animesticker/src/model/anime_model.dart';
import 'package:flutter/material.dart';

class CardAnime extends StatelessWidget {
  final AnimeModel animeModel;

  const CardAnime({
    super.key,
    required this.animeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.9,
      height: 161,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0XFF000000).withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const CardPhotoAnime(),
          Container(
            width: 90.9,
            height: 41,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: const BoxDecoration(
              color: ColorsConstantsLight.colorGrayLight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                "Akame ga Kill one oir",
                style: TextStyle(
                  fontFamily: FontConstants.fontFamily,
                  fontSize: 11,
                  letterSpacing: 0.066,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
