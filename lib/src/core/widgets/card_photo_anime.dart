import 'package:flutter/material.dart';

class CardPhotoAnime extends StatelessWidget {
  final bool isCoverPhoto;
  final String imagePath;

  const CardPhotoAnime({
    super.key,
    this.isCoverPhoto = false,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.9,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: isCoverPhoto
            ? BorderRadius.circular(10)
            : const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
        image: DecorationImage(
          image: AssetImage('assets/anime_profile/images/$imagePath'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
