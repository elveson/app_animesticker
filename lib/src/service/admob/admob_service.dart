import 'dart:developer';

import 'package:app_animesticker/src/core/ui/helpers/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  Future<BannerAd> loadBannerAd() async {
    return BannerAd(
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
    );
  }

  Future<NativeAd> loadNativeAd() async {
    final nativeAd = NativeAd(
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
    await nativeAd.load();
    return nativeAd;
  }
}
