// import 'package:app_animesticker/src/core/ui/helpers/ad_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdWidget extends StatefulWidget {
//   const AdWidget({super.key});

//   @override
//   State<AdWidget> createState() => _AdWidgetState();
// }

// class _AdWidgetState extends State<AdWidget> {
//   NativeAd? _nativeAd;

//   @override
//   void initState() {
//     super.initState();

//     _nativeAd = NativeAd(
//       adUnitId: AdHelper.nativeAdUnitId,
//       factoryId: 'listTile',
//       request: const AdRequest(),
//       listener: NativeAdListener(
//         onAdLoaded: (ad) => setState(() {}),
//         onAdFailedToLoad: (ad, error) => {
//           ad.dispose(),
//           print('Ad load failed: code=${error.code}, message=${error.message}'),
//         },
//       ),
//     );

//     _nativeAd!.load();
//   }

//   @override
//   void dispose() {
//     _nativeAd?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_nativeAd != null && _nativeAd!.isLoaded) {
//       return AdWidget(ad: _nativeAd!);
//     }

//     return Container();
//   }
// }
