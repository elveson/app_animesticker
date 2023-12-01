import 'package:app_animesticker/src/model/anime_model.dart';

enum CategoryStateStatus { loaded, error }

class CategoryState {
  final CategoryStateStatus status;
  final List<AnimeModel> animes;

  CategoryState({required this.status, required this.animes});

  CategoryState copyWith(
      {CategoryStateStatus? status, List<AnimeModel>? animes}) {
    return CategoryState(
        status: status ?? this.status, animes: animes ?? this.animes);
  }
}
