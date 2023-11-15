import 'dart:convert';
import 'dart:developer';

import 'package:app_animesticker/src/core/exceptions/repository_exception.dart';
import 'package:app_animesticker/src/core/fp/either.dart';
import 'package:app_animesticker/src/model/anime_model.dart';
import 'package:app_animesticker/src/repositories/anime/anime_repository.dart';
import 'package:flutter/services.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  @override
  Future<Either<RepositoryException, List<AnimeModel>>> getAnimeList() async {
    try {
      String jsonString = await rootBundle
          .loadString('assets/anime_profile/anime_profiles.json');
      Map<String, dynamic> jsonData = jsonDecode(jsonString);

      final animes = (jsonData['anime_profiles'] as List)
          .map((i) => AnimeModel.fromMap(i))
          .toList();

      animes.sort(
        (a, b) => a.names[0].compareTo(b.names[0]),
      );
      return Success(animes);
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
