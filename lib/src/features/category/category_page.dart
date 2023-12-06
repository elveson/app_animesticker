import 'dart:developer';

import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/core/widgets/anime_sticker_loader.dart';
import 'package:app_animesticker/src/features/category/category_vm.dart';
import 'package:app_animesticker/src/features/category/widget/card_anime.dart';
import 'package:app_animesticker/src/model/anime_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryPage extends ConsumerStatefulWidget {
  final bool isLetterSelected;

  const CategoryPage({
    super.key,
    this.isLetterSelected = false,
  });

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final animeState = ref.watch(categoryVmProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(21.89, 24, 21.89, 0),
      child: animeState.when(
        data: (data) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (context, index) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.stickersData.animesModel.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 16,
                        childAspectRatio: 90.9 / 161,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            final anime = data.stickersData.animesModel[index];
                            Navigator.of(context).pushNamed(
                              '/anime/packages',
                              arguments: {
                                'anime': anime,
                                'navigation': true,
                              },
                            );
                          },
                          child: SizedBox(
                            width: 90.9,
                            height: 161,
                            child: CardAnime(
                              animeModel: data.stickersData.animesModel[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) {
          log('Erro ao carregar animes', error: error, stackTrace: stackTrace);
          return const Center(child: Text('Erro ao carregar pagina'));
        },
        loading: () {
          return const AnimeStickerLoader();
        },
      ),
    );
  }
}
