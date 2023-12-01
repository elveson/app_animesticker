import 'package:app_animesticker/src/model/sticker_data_model.dart';

enum FeedStateStatus { loaded, error }

class FeedState {
  final FeedStateStatus status;
  final StickerDataModel stickersData;

  FeedState({
    required this.status,
    required this.stickersData,
  });

  FeedState copyWith({
    FeedStateStatus? status,
    StickerDataModel? stickersData,
  }) {
    return FeedState(
      status: status ?? this.status,
      stickersData: stickersData ?? this.stickersData,
    );
  }
}
