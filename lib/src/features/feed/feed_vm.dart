import 'package:app_animesticker/src/core/fp/either.dart';
import 'package:app_animesticker/src/core/providers/aplication_provider.dart';
import 'package:app_animesticker/src/features/feed/feed_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_vm.g.dart';

@riverpod
class FeedVm extends _$FeedVm {
  @override
  Future<FeedState> build() async {
    final repository = ref.read(stickerPackRepositoryProvider);
    final result = await repository.loadStickerPack();

    switch (result) {
      case Success(value: final stickerPacks):
        return FeedState(
            status: FeedStateStatus.loaded, stickerPacks: stickerPacks);
      case Failure():
        return FeedState(status: FeedStateStatus.error, stickerPacks: []);
    }
  }
}
