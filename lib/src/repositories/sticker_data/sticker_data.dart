import 'package:app_animesticker/src/core/exceptions/repository_exception.dart';
import 'package:app_animesticker/src/core/fp/either.dart';
import 'package:app_animesticker/src/model/sticker_data_model.dart';

abstract class StickerData {
  Future<Either<RepositoryException, StickerDataModel>> getStickerData();
}
