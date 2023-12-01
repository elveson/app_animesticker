import 'dart:convert';
import 'dart:developer';

import 'package:app_animesticker/src/core/exceptions/repository_exception.dart';
import 'package:app_animesticker/src/core/fp/either.dart';
import 'package:app_animesticker/src/model/sticker_data_model.dart';
import 'package:app_animesticker/src/repositories/sticker_data/sticker_data.dart';
import 'package:flutter/services.dart';

class StickerDataImpl implements StickerData {
  @override
  Future<Either<RepositoryException, StickerDataModel>> getStickerData() async {
    try {
      String jsonStringAnimeData = await rootBundle
          .loadString('assets/anime_profile/anime_profiles.json');
      Map<String, dynamic> jsonDataAnime = jsonDecode(jsonStringAnimeData);
      String jsonStringStickerData =
          await rootBundle.loadString('assets/packages/contents.json');
      Map<String, dynamic> jsonDataSticker = jsonDecode(jsonStringStickerData);

      var jsonStickerData = {...jsonDataSticker, ...jsonDataAnime};
      StickerDataModel stickerData = StickerDataModel.fromMap(jsonStickerData);

      return Success(stickerData);
    } on ArgumentError catch (e, s) {
      log('Json inválido', error: e, stackTrace: s);

      return Failure(
        RepositoryException(
          'Json inválido',
        ),
      );
    }
  }
}
