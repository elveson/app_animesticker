// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_animesticker/src/model/sticker_pack_model.dart';

class StickerDataModel {
  final String? androidPlayStoreLink;
  final String? iosAppStoreLink;
  final List<StickerPackModel> stickerPack;

  StickerDataModel({
    this.androidPlayStoreLink,
    this.iosAppStoreLink,
    required this.stickerPack,
  });

  factory StickerDataModel.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'android_play_store_link': final String androidPlayStoreLink,
        'ios_app_store_link': final String iosAppStoreLink,
        'sticker_pack': final List stickerPack,
      } =>
        StickerDataModel(
          androidPlayStoreLink: androidPlayStoreLink,
          iosAppStoreLink: iosAppStoreLink,
          stickerPack: List<StickerPackModel>.from(
            stickerPack.map(
              (e) => StickerPackModel.fromMap(e),
            ),
          ),
        ),
      _ => throw Exception('Json invalid'),
    };
  }
}
