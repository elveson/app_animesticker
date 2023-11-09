import 'package:app_animesticker/src/core/exceptions/repository_exception.dart';
import 'package:app_animesticker/src/core/fp/either.dart';
import 'package:app_animesticker/src/model/anime_model.dart';

abstract interface class AnimeRepository {
  Future<Either<RepositoryException, List<AnimeModel>>> getAnimeList();
}
