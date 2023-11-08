import 'package:app_animesticker/src/core/exceptions/repository_exception.dart';
import 'package:app_animesticker/src/core/fp/either.dart';
import 'package:app_animesticker/src/model/sticker_pack_model.dart';

abstract interface class StickerPackRepository {
  Future<Either<RepositoryException, List<StickerPackModel>>> loadStickerPack();
}
