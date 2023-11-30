
import 'package:app_animesticker/src/core/exceptions/service_exception.dart';
import 'package:app_animesticker/src/core/fp/either.dart';
import 'package:app_animesticker/src/core/fp/nil.dart';
import 'package:app_animesticker/src/model/sticker_pack_model.dart';

abstract interface class StickerPackService {
  Future<Either<ServiceException, Nil>> saveStickerPack(StickerPackModel stickerPack);
}
