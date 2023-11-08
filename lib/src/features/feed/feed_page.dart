import 'dart:developer';

import 'package:app_animesticker/src/core/widgets/anime_sticker_loader.dart';
import 'package:app_animesticker/src/core/widgets/card_package.dart';
import 'package:app_animesticker/src/features/feed/feed_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedPage extends ConsumerStatefulWidget {
  const FeedPage({super.key});

  @override
  ConsumerState<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends ConsumerState<FeedPage> {
  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedVmProvider);
    // return ListView.builder(
    //   itemCount: 6,
    //   padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
    //   itemBuilder: (context, index) {
    //     return const CardPackage();
    //   },
    // );
    return feedState.when(
      data: (data) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    // HomeEmployeeTile(employee: data.employees[index]),
                    CardPackage(stickerPack: data.stickerPacks[index]),
                // childCount: data.employees.length,
                childCount: data.stickerPacks.length,
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
