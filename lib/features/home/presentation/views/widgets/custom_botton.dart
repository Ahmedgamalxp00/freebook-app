import 'package:flutter/material.dart';
import 'package:freebook_app/core/utils/styles.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton(
      {super.key,
      required this.text,
      required this.color,
      required this.borderRadius,
      required this.backgroundColor,
      this.onPressed});
  final String text;
  final Color color;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              )),
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.textstyle18.copyWith(color: color, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
