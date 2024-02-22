import 'package:flutter/material.dart';
import 'package:freebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_botton.dart';

class BottonAction extends StatelessWidget {
  const BottonAction({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        children: [
          const CustomBotton(
            text: 'Free',
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            backgroundColor: Colors.white,
          ),
          CustomBotton(
            onPressed: () async {
              Uri uri = Uri.parse(book.volumeInfo!.previewLink!);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            text: 'Free preview',
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            backgroundColor: const Color(0xffEF8262),
          ),
          
        ],
      ),
    );
  }
}
