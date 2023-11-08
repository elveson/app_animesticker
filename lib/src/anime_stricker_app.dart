import 'package:app_animesticker/src/core/ui/anime_sticker_theme.dart';
import 'package:app_animesticker/src/features/anime_detail/anime_detail_page.dart';
import 'package:app_animesticker/src/features/anime_packages/anime_packages_page.dart';
import 'package:app_animesticker/src/features/category/category_page.dart';
import 'package:app_animesticker/src/features/home/home_page.dart';
import 'package:app_animesticker/src/features/package/package_page.dart';
import 'package:app_animesticker/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AnimeStrickerApp extends StatelessWidget {
  const AnimeStrickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Anime Stickers",
      debugShowCheckedModeBanner: false,
      theme: AnimeStickerTheme.themeDataLight,
      // home: const SplashPage(),
      // home: const AnimePackagesPage(),
      routes: {
        '/': (_) => const SplashPage(),
        '/home': (_) => const HomePage(),
        '/category': (_) => const CategoryPage(),
        '/package': (_) => const PackagePage(),
        '/anime/packages': (_) => const AnimePackagesPage(),
        '/anime/detail': (_) => const AnimeDetailPage(),
      },
    );
  }
}
