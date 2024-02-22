import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freebook_app/core/utils/assets.dart';
import 'package:freebook_app/core/utils/styles.dart';

class RattingBook extends StatelessWidget {
  const RattingBook({super.key, required this.count, required this.rating});
  final int count;
  final num rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetsData.star,
          semanticsLabel: 'star',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            '$rating',
            style: Styles.textstyle16,
          ),
        ),
        Opacity(
            opacity: 0.5, child: Text('($count)', style: Styles.textstyle16)),
      ],
    );
  }
}
