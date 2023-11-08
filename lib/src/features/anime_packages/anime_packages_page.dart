import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/core/widgets/card_package.dart';
import 'package:app_animesticker/src/core/widgets/card_photo_anime.dart';
import 'package:app_animesticker/src/core/widgets/logo.dart';
import 'package:flutter/material.dart';

class AnimePackagesPage extends StatelessWidget {
  const AnimePackagesPage({super.key});

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
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CardPhotoAnime(isCoverPhoto: true),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        height: 16,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet consectetur. Sed a purus enim tristique. Nunc adipiscing aliquam tincidunt quis libero praesent sed accumsan. Ac faucibus at dui cras nisi. Elit facilisis neque massa et convallis. Diam sed lacinia erat in hac vehicula nunc gravida. Tempor habitasse et nibh ipsum urna pretium. Sociis ipsum eu volutpat donec elit mi. Euismod nunc suspendisse nulla tellus consectetur. Arcu mauris cursus nulla purus tellus pharetra tristique venenatis diam. Mauris vel dolor lectus id. Eget aliquet dignissim pellentesque vitae senectus placerat ultrices laoreet. Libero quam vulputate tempus vitae volutpat purus non arcu. Quam imperdiet sit donec eget lorem tellus ornare.',
                        maxLines: 4,
                        style: TextStyle(
                          fontFamily: FontConstants.fontFamily,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.078,
                          overflow: TextOverflow.ellipsis,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF252525),
                                Color(0xFF252525),
                                Color(0x00252525),
                              ],
                              stops: [0.0, 0.7, 1.0],
                            ).createShader(
                              const Rect.fromLTRB(0, 0, 0, 230),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/anime/detail');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const ImageIcon(
                    AssetImage('assets/icons/arrow_right.png'),
                    color: ColorsConstantsLight.colorGrayLight,
                  ),
                ),
              ],
            ),
          ),
          // const CardPackage(),
          // const CardPackage(),
        ],
      ),
    );
  }
}
