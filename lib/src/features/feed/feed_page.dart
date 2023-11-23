import 'dart:developer';

import 'package:app_animesticker/src/core/providers/aplication_provider.dart';
import 'package:app_animesticker/src/core/ui/helpers/ad_helper.dart';
import 'package:app_animesticker/src/core/widgets/anime_sticker_loader.dart';
import 'package:app_animesticker/src/core/widgets/card_package.dart';
import 'package:app_animesticker/src/features/feed/feed_vm.dart';
import 'package:app_animesticker/src/model/sticker_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FeedPage extends ConsumerStatefulWidget {
  const FeedPage({super.key});

  @override
  ConsumerState<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends ConsumerState<FeedPage> {
  late final nativeAd;

  // NativeAd? _nativeAd;

  @override
  void initState() {
    super.initState();
    nativeAd = ref.read(adMobServiceProvider).createNativeAd().load();
    // NativeAd(
    //   adUnitId: AdHelper.nativeAdUnitId,
    //   factoryId: 'listTile',
    //   request: const AdRequest(),
    //   listener: NativeAdListener(
    //     onAdLoaded: (ad) {
    //       setState(() {
    //         _nativeAd = ad as NativeAd;
    //       });
    //     },
    //     onAdFailedToLoad: (ad, error) {
    //       // Releases an ad resource when it fails to load
    //       ad.dispose();
    //       debugPrint(
    //           'Ad load failed (code=${error.code} message=${error.message})');
    //     },
    //   ),
    // ).load();
  }

  @override
  void dispose() {
    super.dispose();
    nativeAd?.dispose();
  }

  int _getDestinationItemIndex(int rawIndex) {
    if (rawIndex >= 3 && nativeAd != null) {
      return rawIndex - 1;
    }
    return rawIndex;
  }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedVmProvider);

    // @override
    // void initState() {
    //   super.initState();
    //   itemList = feedState.value!.stickerPacks.cast<Object>();
    // }

    // @override
    // void didChangeDependencies() {
    //   super.didChangeDependencies();
    //   final adState = Provider.of<AdState>(context);
    //   adState.initialization.then((status){
    //     setState(() {
    //       for(int i = itemList.length - 2; i >= 1 ; i-=10){
    //         itemList.insert(i, Baner)
    //       }
    //     });
    //   })
    // }

    return feedState.when(
      data: (data) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount:
                    data.stickerPacks.length + (nativeAd != null ? 1 : 0),
                (context, index) {
                  if (nativeAd != null && (index + 1) % 4 == 0) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 320, // minimum recommended width
                          minHeight: 90, // minimum recommended height
                          maxWidth: 320,
                          maxHeight: 200,
                        ),
                        child: AdWidget(
                            ad: NativeAd(
                          adUnitId: AdHelper.nativeAdUnitId,
                          listener: NativeAdListener(
                            onAdLoaded: (ad) {
                              debugPrint('$NativeAd loaded.');
                              // setState(() {
                              //   _nativeAdIsLoaded = true;
                              // });
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
                            cornerRadius: 30.0,
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
                        )..load()),
                      ),
                    );
                  } else {
                    return CardPackage(
                        stickerPack:
                            data.stickerPacks[_getDestinationItemIndex(index)]);
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
