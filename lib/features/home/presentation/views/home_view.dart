import 'package:flutter/material.dart';
import 'package:freebook_app/core/utils/styles.dart';
import 'widgets/best_seller_listview.dart';

import 'widgets/featured_listview.dart';
import 'widgets/home_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeViewAppBar(),
                FeaturedBooksListView(),
                SizedBox(
                  height: 50,
                ),
                // BestSellerSection(),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    'Newest Books',
                    style: Styles.textstyle18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: BestSellerListView(),
            ),
          )
        ],
      )),
    );
  }
}
