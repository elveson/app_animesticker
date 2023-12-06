import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/core/widgets/ads_content.dart';
import 'package:app_animesticker/src/core/widgets/logo.dart';
import 'package:app_animesticker/src/core/widgets/package_icon_content.dart';
import 'package:app_animesticker/src/core/widgets/sticker_content.dart';
import 'package:app_animesticker/src/features/package/widget/button_add_sticker.dart';

import 'package:app_animesticker/src/features/package/widget/label_package.dart';
import 'package:app_animesticker/src/model/anime_model.dart';
import 'package:app_animesticker/src/model/sticker_pack_model.dart';
import 'package:flutter/material.dart';

class PackagePage extends StatelessWidget {
  // final StickerPackModel stickerPack;

  const PackagePage({
    super.key,
    // required this.stickerPack,
  });

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final stickerPack = args['stickerPack'] as StickerPackModel;
    final anime = args['anime'] as AnimeModel;

    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/anime/detail', arguments: {
                'anime': anime,
                'navigation': false,
              });
            },
            icon: const ImageIcon(
              AssetImage('assets/icons/book_about.png'),
              color: ColorsConstantsLight.colorText,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage('assets/icons/share.png'),
              color: ColorsConstantsLight.colorPurple,
            ),
          ),
        ],
        leading: IconButton(
          icon: const ImageIcon(
            AssetImage('assets/icons/arrow_left.png'),
            color: ColorsConstantsLight.colorText,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26),
            child: Center(
                child: PackageIcon(
              icon: stickerPack.trayImageFile,
              namePackage: stickerPack.identifier,
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  // margin: ,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: ColorsConstantsLight.colorGrayLight,
                  ),
                  child: Text(
                    stickerPack.name,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: FontConstants.fontFamily,
                      color: ColorsConstantsLight.colorText,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.32,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LabelPackage(textLabel: '300kb'),
                    LabelPackage(
                        textLabel: '${stickerPack.stickers.length} Stickers'),
                    const LabelPackage(textLabel: 'by Tubaraum'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 1,
                      (context, index) {
                        return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: stickerPack.stickers.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 16,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: StickerContent(
                                widthSticker: 72,
                                heightSticker: 72,
                                pathPackage: stickerPack.identifier,
                                pathSticker:
                                    stickerPack.stickers[index].imageFile,
                                amountSticker:
                                    stickerPack.stickers.length.toString(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            color: ColorsConstantsLight.colorGrayLight,
            child: const Column(
              children: [
                Text(
                  'Add to:',
                  style: TextStyle(
                    fontFamily: FontConstants.fontFamily,
                    color: ColorsConstantsLight.colorBlack,
                    fontSize: 15,
                    letterSpacing: -0.24,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 32,
                  children: [
                    ButtonAddSticker(
                      iconPath: 'assets/icons/line.png',
                      label: 'Line',
                    ),
                    ButtonAddSticker(
                      iconPath: 'assets/icons/telegram.png',
                      label: 'Telegram',
                    ),
                    ButtonAddSticker(
                      iconPath: 'assets/icons/whatsapp.png',
                      label: 'WhatsApp',
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                AdsContent()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
