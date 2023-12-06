import 'dart:developer';

import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/core/widgets/anime_sticker_loader.dart';
import 'package:app_animesticker/src/core/widgets/card_package.dart';
import 'package:app_animesticker/src/core/widgets/card_photo_anime.dart';
import 'package:app_animesticker/src/core/widgets/logo.dart';
import 'package:app_animesticker/src/features/feed/feed_vm.dart';
import 'package:app_animesticker/src/model/anime_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimePackagesPage extends ConsumerWidget {
  const AnimePackagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final anime = args['anime'] as AnimeModel;
    final isNavigation = args['navigation'] as bool;

    final feedState = ref.watch(feedVmProvider);
    bool nativeAdIsLoaded = true;
    int adCount = 0;

    void redirect(bool isNavigation) {
      if (isNavigation) {
        Navigator.of(context).pushNamed('/anime/detail', arguments: {
          'anime': anime,
          'navigation': true,
        });
      } else {
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Logo(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage('assets/icons/share.png'),
              color: ColorsConstantsLight.colorPurple,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const ImageIcon(
            AssetImage('assets/icons/arrow_left.png'),
            color: ColorsConstantsLight.colorText,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardPhotoAnime(
                    isCoverPhoto: true, imagePath: anime.fileTrayImage),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        anime.names[0],
                        style: const TextStyle(
                          fontFamily: FontConstants.fontFamily,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.408,
                          color: ColorsConstantsLight.colorText,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        anime.description.entries.first.value,
                        maxLines: 4,
                        style: TextStyle(
                          fontFamily: FontConstants.fontFamily,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.078,
                          overflow: TextOverflow.ellipsis,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF252525),
                                Color(0xFF252525),
                                Color(0x00252525),
                              ],
                              stops: [0.0, 0.7, 1.0],
                            ).createShader(
                              const Rect.fromLTRB(0, 0, 0, 230),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                ElevatedButton(
                  onPressed: () => redirect(isNavigation),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const ImageIcon(
                    AssetImage('assets/icons/arrow_right.png'),
                    color: ColorsConstantsLight.colorGrayLight,
                  ),
                ),
              ],
            ),
          ),

          // final nativeAd = ref.watch(adMobServiceProvider);
          // nativeAd.loadNativeAd();
          feedState.when(
            data: (data) {
              final animeFiltered = data.stickersData.stickersPacks
                  .where((package) => package.animeIdentifier == anime.id)
                  .map((package) => package)
                  .toList();

              return Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount:
                            (animeFiltered.length + animeFiltered.length ~/ 4)
                                .ceil(),
                        (context, index) {
                          log((data.stickersData.stickersPacks.length)
                              .toString());

                          if ((index + 1) % 4 == 0) {
                            adCount++;
                            return Container(
                              // height: 156.1435,
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  // minWidth: 156.1435, // minimum recommended width
                                  minHeight:
                                      156.1435, // minimum recommended height
                                  // maxWidth: 156.1435,
                                  maxHeight: 156.1435,
                                ),
                                child:
                                    (nativeAdIsLoaded /*&& _nativeAd != null*/)
                                        ? const Text('data')
                                        // AdWidget(
                                        //     ad: _nativeAd!,
                                        //   )
                                        : const CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            int dataIndex = index - adCount;

                            // log(data.stickersData.stickersPacks.length.toString());

                            return CardPackage(
                              stickerPack: animeFiltered[dataIndex],
                              anime: anime,
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              );
            },
            error: (error, stackTrace) {
              log('Erro ao carregar packs de stickers',
                  error: error, stackTrace: stackTrace);
              return const Center(child: Text('Erro ao carregar pagina'));
            },
            loading: () {
              return const AnimeStickerLoader();
            },
          ),
        ],
      ),
    );
  }
}
