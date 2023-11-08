import 'package:app_animesticker/src/anime_stricker_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: AnimeStrickerApp(),
  ));
}
