import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/core/widgets/package_icon_content.dart';
import 'package:app_animesticker/src/core/widgets/sticker_content.dart';
import 'package:app_animesticker/src/model/sticker_pack_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPackage extends StatelessWidget {
  final StickerPackModel stickerPack;

  const CardPackage({
    super.key,
    required this.stickerPack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/package');
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 156.1435,
          // margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorsConstantsLight.colorGrayLight,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  PackageIcon(
                    namePackage: stickerPack.identifier,
                    icon: stickerPack.trayImageFile,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              stickerPack.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: ColorsConstantsLight.colorText,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.24,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            // final stickerLenght = stickerPack.stickers.length;
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StickerContent(
                                widthSticker: 46,
                                heightSticker: 46,
                                pathPackage: stickerPack.identifier,
                                pathSticker: stickerPack.stickers[0].imageFile,
                              ),
                              StickerContent(
                                widthSticker: 46,
                                heightSticker: 46,
                                pathPackage: stickerPack.identifier,
                                pathSticker: stickerPack.stickers[1].imageFile,
                              ),
                              StickerContent(
                                widthSticker: 46,
                                heightSticker: 46,
                                pathPackage: stickerPack.identifier,
                                pathSticker: stickerPack.stickers[2].imageFile,
                              ),
                              StickerContent(
                                widthSticker: 46,
                                heightSticker: 46,
                                isAmountSticker: true,
                                pathPackage: stickerPack.identifier,
                                pathSticker: stickerPack.stickers[3].imageFile,
                                amountSticker: (stickerPack.stickers.length - 4)
                                    .toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            child: CircleAvatar(
                              maxRadius: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            stickerPack.identifier.split('_')[1],
                            // stickerPack.identifier.split('_').getRange(1, stickerPack.identifier.split('_').length - 1).join(' ')
                            style: const TextStyle(
                              fontSize: 11,
                              color: ColorsConstantsLight.subtle2,
                              letterSpacing: 0.66,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28.14,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const ImageIcon(
                            AssetImage("assets/icons/whatsapp.png"),
                            color: ColorsConstantsLight.colorPrimary,
                            size: 11.06,
                          ),
                          label: Text(
                            "Steal package",
                            style: TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              letterSpacing: -0.5,
                              color: ColorsConstantsLight.colorPrimary,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 11.78, horizontal: 15.70),
                            alignment: Alignment.center,
                            side: const BorderSide(
                              color: ColorsConstantsLight.colorPrimary,
                              width: 0.655,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
