import 'package:app_animesticker/src/core/restClient/rest_client.dart';
import 'package:app_animesticker/src/repositories/anime/anime_repository.dart';
import 'package:app_animesticker/src/repositories/anime/anime_repository_impl.dart';
import 'package:app_animesticker/src/repositories/sticker_pack/sticker_pack_repository.dart';
import 'package:app_animesticker/src/repositories/sticker_pack/sticker_pack_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'aplication_provider.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();

@Riverpod(keepAlive: true)
StickerPackRepository stickerPackRepository(StickerPackRepositoryRef ref) =>
    StickerPackRepositoryImpl();

@Riverpod(keepAlive: true)
AnimeRepository animeRepository(AnimeRepositoryRef ref) =>
    AnimeRepositoryImpl();
