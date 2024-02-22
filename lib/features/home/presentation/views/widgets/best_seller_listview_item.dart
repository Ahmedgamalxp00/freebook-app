import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freebook_app/core/utils/app_router.dart';
import 'package:freebook_app/core/utils/styles.dart';
import 'package:freebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:go_router/go_router.dart';

import 'ratting_book.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kHomeDetailesView, extra: book);
      },
      child: Row(
        children: [
          SizedBox(
            height: 125,
            child: AspectRatio(
              aspectRatio: 2.7 / 4,
              child: CachedNetworkImage(
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
                fit: BoxFit.fill,
                imageUrl: book.volumeInfo?.imageLinks?.thumbnail ??
                    'https://www.shutterstock.com/image-vector/no-image-available-icon-template-260nw-1036735678.jpg',
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  book.volumeInfo!.title ?? '',
                  style: Styles.textstyle20,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: SizedBox(
                  width: 200,
                  child: Opacity(
                    opacity: 0.7,
                    child: Text(
                      book.volumeInfo?.authors?[0] ?? '',
                      style: Styles.textstyle14,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Free',
                      style: Styles.textstyle30.copyWith(
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    RattingBook(
                      count: book.volumeInfo?.ratingsCount ?? 0,
                      rating: book.volumeInfo?.averageRating ?? 0,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
