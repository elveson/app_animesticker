import 'package:app_animesticker/src/core/fp/either.dart';
import 'package:app_animesticker/src/core/providers/aplication_provider.dart';
import 'package:app_animesticker/src/features/feed/feed_status.dart';
import 'package:app_animesticker/src/model/sticker_data_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_vm.g.dart';

@riverpod
class FeedVm extends _$FeedVm {
  @override
  Future<FeedState> build() async {
    final repository = ref.read(stickerDataRepositoryProvider);
    final result = await repository.getStickerData();

    switch (result) {
      case Success(value: final stickersData):
        return FeedState(
          status: FeedStateStatus.loaded,
          stickersData: stickersData,
        );
      case Failure():
        return FeedState(
          status: FeedStateStatus.error,
          stickersData: StickerDataModel(
            animesModel: [],
            stickersPacks: [],
          ),
        );
    }
  }
}
