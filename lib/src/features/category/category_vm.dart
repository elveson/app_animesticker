import 'package:app_animesticker/src/core/fp/either.dart';
import 'package:app_animesticker/src/core/providers/aplication_provider.dart';
import 'package:app_animesticker/src/features/category/category_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_vm.g.dart';

@riverpod
class CategoryVm extends _$CategoryVm {
  @override
  Future<CategoryState> build() async {
    final repository = ref.read(animeRepositoryProvider);
    final result = await repository.getAnimeList();

    switch (result) {
      case Success(value: final animes):
        return CategoryState(
            status: CategoryStateStatus.loaded, animes: animes);
      case Failure():
        return CategoryState(status: CategoryStateStatus.error, animes: []);
    }
  }
}
