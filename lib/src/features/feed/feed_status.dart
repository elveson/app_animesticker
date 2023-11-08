import 'package:app_animesticker/src/model/sticker_pack_model.dart';

enum FeedStateStatus { loaded, error }

class FeedState {
  final FeedStateStatus status;
  final List<StickerPackModel> stickerPacks;

  FeedState({required this.status, required this.stickerPacks});

  FeedState copyWith(
      {FeedStateStatus? status, List<StickerPackModel>? stickerPacks}) {
    return FeedState(
        status: status ?? this.status,
        stickerPacks: stickerPacks ?? this.stickerPacks);
  }
}
