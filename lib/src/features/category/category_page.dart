import 'dart:developer';

import 'package:app_animesticker/src/core/providers/aplication_provider.dart';
import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/core/widgets/anime_sticker_loader.dart';
import 'package:app_animesticker/src/features/category/category_vm.dart';
import 'package:app_animesticker/src/features/category/widget/card_anime.dart';
import 'package:app_animesticker/src/features/category/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryPage extends ConsumerWidget {
  final bool isLetterSelected;

  const CategoryPage({
    super.key,
    this.isLetterSelected = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeState = ref.watch(categoryVmProvider);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SearchWidget(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.89),
            child: Row(
              children: [
                Expanded(
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
                                  itemCount: data.animes.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 90.9 / 161,
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {},
                                      child: SizedBox(
                                        width: 90.9,
                                        height: 161,
                                        child: CardAnime(
                                          animeModel: data.animes[index],
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
                      log('Erro ao carregar animes',
                          error: error, stackTrace: stackTrace);
                      return const Center(
                          child: Text('Erro ao carregar pagina'));
                    },
                    loading: () {
                      return const AnimeStickerLoader();
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                SizedBox(
                  width: 20.22,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ#'
                        .split('')
                        .map((String letter) {
                      return Container(
                        width: 20.22,
                        height: 20.22,
                        decoration: BoxDecoration(
                          color: isLetterSelected
                              ? ColorsConstantsLight.colorGrayLight
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          letter,
                          style: TextStyle(
                            fontSize: isLetterSelected ? 10.111 : 11,
                            fontWeight: isLetterSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            letterSpacing: isLetterSelected ? -0.202 : 0.066,
                            color: isLetterSelected
                                ? ColorsConstantsLight.colorGrayLight
                                : ColorsConstantsLight.colorPrimary,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
