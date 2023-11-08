import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:app_animesticker/src/features/category/widget/card_anime.dart';
import 'package:app_animesticker/src/features/category/widget/search_widget.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final bool isLetterSelected;

  const CategoryPage({
    super.key,
    this.isLetterSelected = false,
  });

  @override
  Widget build(BuildContext context) {
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
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                          (context, index) {
                            return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 20,
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
                                  child: const SizedBox(
                                    width: 90.9,
                                    height: 161,
                                    child: CardAnime(),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
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
