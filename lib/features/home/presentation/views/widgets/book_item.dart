import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freebook_app/core/utils/app_router.dart';
import 'package:freebook_app/features/home/data/models/book_model/book_model.dart';

import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.imageUrl, required this.book});
  final String imageUrl;
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kHomeDetailesView, extra: book);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 2.7 / 4,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
              fit: BoxFit.fill,
              imageUrl: imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
