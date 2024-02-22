import 'package:flutter/material.dart';
import 'package:freebook_app/core/utils/styles.dart';

class CustomErorrWidget extends StatelessWidget {
  const CustomErorrWidget({super.key, required this.errMassage});
  final String errMassage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMassage,
        style: Styles.textstyle18,
      ),
    );
  }
}
