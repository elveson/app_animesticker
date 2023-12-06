import 'package:app_animesticker/src/core/fp/either.dart';
import 'package:app_animesticker/src/core/providers/aplication_provider.dart';
import 'package:app_animesticker/src/features/category/category_state.dart';
import 'package:app_animesticker/src/model/sticker_data_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_vm.g.dart';

@riverpod
class CategoryVm extends _$CategoryVm {
  @override
  Future<CategoryState> build() async {
    final repository = ref.read(stickerDataRepositoryProvider);
    final result = await repository.getStickerData();

    switch (result) {
      case Success(value: final stickersData):
        return CategoryState(
          status: CategoryStateStatus.loaded,
          stickersData: stickersData,
        );
      case Failure():
        return CategoryState(
          status: CategoryStateStatus.error,
          stickersData: StickerDataModel(
            animesModel: [],
            stickersPacks: [],
          ),
        );
    }
  }
}
