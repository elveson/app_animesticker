import 'package:flutter/material.dart';

class CardPhotoAnime extends StatelessWidget {
  final bool isCoverPhoto;
  const CardPhotoAnime({
    super.key,
    this.isCoverPhoto = false,
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
        image: const DecorationImage(
          image: NetworkImage('https://source.unsplash.com/random/300x200'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
