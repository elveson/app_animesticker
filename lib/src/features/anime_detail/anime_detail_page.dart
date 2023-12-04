import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/core/widgets/ads_content.dart';
import 'package:app_animesticker/src/core/widgets/card_photo_anime.dart';
import 'package:app_animesticker/src/features/anime_detail/widget/label_anime_widget.dart';
import 'package:app_animesticker/src/core/widgets/logo.dart';
import 'package:app_animesticker/src/model/anime_model.dart';
import 'package:flutter/material.dart';

class AnimeDetailPage extends StatelessWidget {
  const AnimeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final anime = ModalRoute.of(context)!.settings.arguments as AnimeModel;
    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage('assets/icons/share.png'),
              color: ColorsConstantsLight.colorPurple,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const ImageIcon(
            AssetImage('assets/icons/arrow_left.png'),
            color: ColorsConstantsLight.colorText,
          ),
        ),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
              child: Column(
                children: [
                  Center(
                    child: CardPhotoAnime(
                        isCoverPhoto: true, imagePath: anime.fileTrayImage),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    anime.names[0],
                    style: const TextStyle(
                      fontFamily: FontConstants.fontFamily,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.408,
                      color: ColorsConstantsLight.colorText,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    anime.description.entries.first.value,
                    style: const TextStyle(
                      fontFamily: FontConstants.fontFamily,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.078,
                      color: ColorsConstantsLight.colorText,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: anime.genres.entries
                        .where((entry) => entry.key == 'en')
                        .expand((element) => element.value
                            .map((e) => LabelAnimeWidget(textLabel: e)))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/anime/packages');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 24),
                    ),
                    child: const Text(
                      'See Anime Packages',
                      style: TextStyle(
                        fontFamily: FontConstants.fontFamily,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: ColorsConstantsLight.colorGrayLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
              child: AdsContent(),
            ),
          )
        ],
      ),
    );
  }
}
