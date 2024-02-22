import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key, this.onSubmitted, this.iconTap, this.onChanged});
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final void Function()? iconTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'please enter your category',
        suffixIcon: GestureDetector(
          onTap: iconTap,
          child: Icon(Icons.search),
        ),
        suffixIconColor: Colors.white,
        enabledBorder: outLineInputBorder(),
        focusedBorder: outLineInputBorder(),
      ),
    );
  }
}

OutlineInputBorder outLineInputBorder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(
        color: Colors.white,
      ));
}
