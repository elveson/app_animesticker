import 'dart:developer';

import 'package:app_animesticker/src/core/providers/aplication_provider.dart';
import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/core/ui/helpers/ad_helper.dart';
import 'package:app_animesticker/src/service/admob/admob_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsContent extends ConsumerStatefulWidget {
  const AdsContent({super.key});

  @override
  ConsumerState<AdsContent> createState() => _AdsContentState();
}

class _AdsContentState extends ConsumerState<AdsContent> {
  @override
  Widget build(BuildContext context) {
    final adMobRef = ref.watch(adMobServiceProvider);
    // AdMobService adMob = AdMobService();
    // BannerAd myBanner = adMob.createBannerAd();
    // myBanner.load();
    final banner = adMobRef.loadBannerAd();

    return SizedBox(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorsConstantsLight.colorGrayDark,
        ),
        child: AdWidget(
          ad: BannerAd(
            adUnitId: AdHelper.bannerAdUnitId,
            size: AdSize.banner,
            request: const AdRequest(),
            listener: BannerAdListener(
              onAdLoaded: (Ad ad) => log('Ad loaded.'),
              onAdFailedToLoad: (Ad ad, LoadAdError error) {
                log('Ad failed to load: $error');
              },
              onAdOpened: (Ad ad) => log('Ad opened.'),
              onAdClosed: (Ad ad) => log('Ad closed.'),
              onAdImpression: (Ad ad) => log('Ad impression.'),
            ),
          )..load(),
        ),
      ),
    );
  }
}
