import 'package:flutter/material.dart';
import 'package:flutter_bookly_app/constants.dart';

import '../../../../../core/utils/styles.dart';
import 'best_seller_list_view.dart';
import 'custom_appbar.dart';
import 'featureed_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const FeaturedBooksListView(),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Newset Books',
                    style:
                        Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        // const SliverFillRemaining(
        const SliverToBoxAdapter(
          child: BestSellerListView(),
        )
      ],
    );
  }
}
