import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:freebook_app/core/utils/styles.dart';
import 'package:freebook_app/features/home/data/models/book_model/book_model.dart';

import 'ratting_book.dart';

class BookDetailes extends StatelessWidget {
  const BookDetailes({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
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
          height: 43,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            book.volumeInfo!.title!,
            textAlign: TextAlign.center,
            style: Styles.textstyle30
                .copyWith(fontFamily: 'GT Sectra Fine Regular'),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo!.authors![0],
            textAlign: TextAlign.center,
            style: Styles.textstyle18,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        RattingBook(
          count: book.volumeInfo?.ratingsCount ?? 0,
          rating: book.volumeInfo?.averageRating ?? 0,
        ),
      ],
    );
  }
}
