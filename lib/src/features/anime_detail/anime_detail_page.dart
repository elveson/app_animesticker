import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/core/widgets/ads_content.dart';
import 'package:app_animesticker/src/core/widgets/card_photo_anime.dart';
import 'package:app_animesticker/src/features/anime_detail/widget/label_anime_widget.dart';
import 'package:app_animesticker/src/core/widgets/logo.dart';
import 'package:flutter/material.dart';

class AnimeDetailPage extends StatelessWidget {
  const AnimeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const Center(
                      // child: CardPhotoAnime(isCoverPhoto: true),
                      ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Algum Anime',
                    style: TextStyle(
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
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur. Sed a purus enim tristique. Nunc adipiscing aliquam tincidunt quis libero praesent sed accumsan. Ac faucibus at dui cras nisi. Elit facilisis neque massa et convallis. Diam sed lacinia erat in hac vehicula nunc gravida. Tempor habitasse et nibh ipsum urna pretium. Sociis ipsum eu volutpat donec elit mi. Euismod nunc suspendisse nulla tellus consectetur. Arcu mauris cursus nulla purus tellus pharetra tristique venenatis diam. Mauris vel dolor lectus id. Eget aliquet dignissim pellentesque vitae senectus placerat ultrices laoreet. Libero quam vulputate tempus vitae volutpat purus non arcu. Quam imperdiet sit donec eget lorem tellus ornare.',
                    style: TextStyle(
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
                  const Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: [
                      LabelAnimeWidget(textLabel: 'Release'),
                      LabelAnimeWidget(textLabel: 'Seasons'),
                      LabelAnimeWidget(textLabel: 'Geres'),
                    ],
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
