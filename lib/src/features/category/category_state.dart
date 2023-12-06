// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_animesticker/src/model/anime_model.dart';
import 'package:app_animesticker/src/model/sticker_data_model.dart';

enum CategoryStateStatus { loaded, error }

class CategoryState {
  final CategoryStateStatus status;
  final StickerDataModel stickersData;

  CategoryState({required this.status, required this.stickersData});

  CategoryState copyWith({
    CategoryStateStatus? status,
    StickerDataModel? stickersData,
  }) {
    return CategoryState(
      status: status ?? this.status,
      stickersData: stickersData ?? this.stickersData,
    );
  }
}
