import 'dart:developer';

import 'package:app_animesticker/src/core/providers/aplication_provider.dart';
import 'package:app_animesticker/src/core/ui/helpers/ad_helper.dart';
import 'package:app_animesticker/src/core/widgets/anime_sticker_loader.dart';
import 'package:app_animesticker/src/core/widgets/card_package.dart';
import 'package:app_animesticker/src/features/feed/feed_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FeedPage extends ConsumerStatefulWidget {
  const FeedPage({super.key});

  @override
  ConsumerState<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends ConsumerState<FeedPage> {
  late final NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;

  @override
  void initState() {
    super.initState();
    _nativeAdIsLoaded = true;
    // loadAd();
    _nativeAd = NativeAd(
      adUnitId: AdHelper.nativeAdUnitId,
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('$NativeAd loaded.');
          setState(() {
            _nativeAdIsLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          // Dispose the ad here to free resources.
          debugPrint('$NativeAd failed to load: $error');
          ad.dispose();
        },
      ),
      request: const AdRequest(),
      // Styling
      nativeTemplateStyle: NativeTemplateStyle(
        // Required: Choose a template.
        templateType: TemplateType.medium,
        // Optional: Customize the ad's style.
        mainBackgroundColor: Colors.purple,
        cornerRadius: 10.0,
        callToActionTextStyle: NativeTemplateTextStyle(
            textColor: Colors.cyan,
            backgroundColor: Colors.red,
            style: NativeTemplateFontStyle.monospace,
            size: 16.0),
        primaryTextStyle: NativeTemplateTextStyle(
            textColor: Colors.red,
            backgroundColor: Colors.cyan,
            style: NativeTemplateFontStyle.italic,
            size: 16.0),
        secondaryTextStyle: NativeTemplateTextStyle(
            textColor: Colors.green,
            backgroundColor: Colors.black,
            style: NativeTemplateFontStyle.bold,
            size: 16.0),
        tertiaryTextStyle: NativeTemplateTextStyle(
            textColor: Colors.brown,
            backgroundColor: Colors.amber,
            style: NativeTemplateFontStyle.normal,
            size: 16.0),
      ),
    );
    _nativeAd!.load();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  // void loadAd() {
  //   _nativeAd = NativeAd(
  //     adUnitId: AdHelper.nativeAdUnitId,
  //     listener: NativeAdListener(
  //       onAdLoaded: (ad) {
  //         debugPrint('$NativeAd loaded.');
  //         setState(() {
  //           _nativeAdIsLoaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         // Dispose the ad here to free resources.
  //         debugPrint('$NativeAd failed to load: $error');
  //         ad.dispose();
  //       },
  //     ),
  //     request: const AdRequest(),
  //     // Styling
  //     nativeTemplateStyle: NativeTemplateStyle(
  //       // Required: Choose a template.
  //       templateType: TemplateType.medium,
  //       // Optional: Customize the ad's style.
  //       mainBackgroundColor: Colors.purple,
  //       cornerRadius: 10.0,
  //       callToActionTextStyle: NativeTemplateTextStyle(
  //           textColor: Colors.cyan,
  //           backgroundColor: Colors.red,
  //           style: NativeTemplateFontStyle.monospace,
  //           size: 16.0),
  //       primaryTextStyle: NativeTemplateTextStyle(
  //           textColor: Colors.red,
  //           backgroundColor: Colors.cyan,
  //           style: NativeTemplateFontStyle.italic,
  //           size: 16.0),
  //       secondaryTextStyle: NativeTemplateTextStyle(
  //           textColor: Colors.green,
  //           backgroundColor: Colors.black,
  //           style: NativeTemplateFontStyle.bold,
  //           size: 16.0),
  //       tertiaryTextStyle: NativeTemplateTextStyle(
  //           textColor: Colors.brown,
  //           backgroundColor: Colors.amber,
  //           style: NativeTemplateFontStyle.normal,
  //           size: 16.0),
  //     ),
  //   )..load();
  // }

  // Future<void> loadNativeAd() async {
  //   final nativeAd = ref.watch(adMobServiceProvider);
  //   _nativeAd = await nativeAd.loadNativeAd();
  // }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedVmProvider);

    // final nativeAd = ref.watch(adMobServiceProvider);
    // nativeAd.loadNativeAd();
    return feedState.when(
      data: (data) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: data.stickersData.stickersPacks.length +
                    (_nativeAd != null ? 1 : 0),
                (context, index) {
                  final animeIdentifier =
                      data.stickersData.stickersPacks[index].animeIdentifier;

                  if ((index + 1) % 4 == 0) {
                    return Container(
                      // height: 156.1435,
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          // minWidth: 156.1435, // minimum recommended width
                          minHeight: 156.1435, // minimum recommended height
                          // maxWidth: 156.1435,
                          maxHeight: 156.1435,
                        ),
                        child: (_nativeAdIsLoaded && _nativeAd != null)
                            ? AdWidget(
                                ad: _nativeAd!,
                              )
                            : const CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    log(index.toString());
                    return CardPackage(
                      stickerPack: data.stickersData.stickersPacks[index],
                      anime: data.stickersData.animesModel.firstWhere(
                        (anime) => anime.id == animeIdentifier,
                      ),
                    );
                  }
                },
              ),
            )
          ],
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
    );
  }
}
