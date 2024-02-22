import 'package:flutter/material.dart';
import 'package:freebook_app/core/utils/styles.dart';

import 'related_books_listview.dart';

class RelatedBooksSection extends StatelessWidget {
  const RelatedBooksSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'You can also like',
            style: Styles.textstyle16,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        RelatedBooksListView(),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
