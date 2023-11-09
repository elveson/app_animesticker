import 'dart:convert';
import 'dart:developer';

import 'package:app_animesticker/src/core/exceptions/repository_exception.dart';
import 'package:app_animesticker/src/core/fp/either.dart';
import 'package:app_animesticker/src/model/sticker_pack_model.dart';
import 'package:app_animesticker/src/repositories/sticker_pack/sticker_pack_repository.dart';

import 'package:flutter/services.dart';

class StickerPackRepositoryImpl implements StickerPackRepository {
  @override
  Future<Either<RepositoryException, List<StickerPackModel>>>
      loadStickerPack() async {
    try {
      // final Response(:List data) = await restClient.get(
      //   'contents.json',
      //   options: Options(headers: {
      //     'Content-Type': 'application/json',
      //   }),
      // );
      // print(data);

      // final stickers = data.map((e) => StickerPackModel.fromMap(e)).toList();
      // return Success(stickers);
      String jsonString =
          await rootBundle.loadString('assets/packages/contents.json');
      Map<String, dynamic> jsonData = jsonDecode(jsonString);
      // return StickerPackModel.fromMap(jsonData);
      // print(jsonData);
      // List<StickerPackModel> stickers =
      //     jsonData.map((e) => StickerPackModel.fromMap(e)).toList();

      final stickers = (jsonData['sticker_packs'] as List)
          .map((i) => StickerPackModel.fromMap(i))
          .toList();
      return Success(stickers);
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
