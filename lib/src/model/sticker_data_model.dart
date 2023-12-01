// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_animesticker/src/model/anime_model.dart';
import 'package:app_animesticker/src/model/sticker_pack_model.dart';

class StickerDataModel {
  final String? androidPlayStoreLink;
  final String? iosAppStoreLink;
  final List<StickerPackModel> stickersPacks;
  final List<AnimeModel> animesModel;

  StickerDataModel({
    this.androidPlayStoreLink,
    this.iosAppStoreLink,
    required this.stickersPacks,
    required this.animesModel,
  });

  factory StickerDataModel.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'android_play_store_link': final String androidPlayStoreLink,
        'ios_app_store_link': final String iosAppStoreLink,
        'sticker_packs': final List stickerPacks,
        'anime_profiles': final List animeModel,
      } =>
        StickerDataModel(
          androidPlayStoreLink: androidPlayStoreLink,
          iosAppStoreLink: iosAppStoreLink,
          stickersPacks: List<StickerPackModel>.from(
            stickerPacks.map(
              (e) => StickerPackModel.fromMap(e),
            ),
          ),
          animesModel: List<AnimeModel>.from(
            animeModel.map(
              (e) => AnimeModel.fromMap(e),
            ),
          ),
        ),
      _ => throw Exception('Json invalid'),
    };
  }
}
