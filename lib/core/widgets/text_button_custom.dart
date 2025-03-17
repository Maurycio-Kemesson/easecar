import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final TextStyle styleText;
  final bool underlinedText;
  final Color underlinedTextColor;

  const TextButtonCustom({
    super.key,
    this.onPressed,
    required this.title,
    this.styleText = const TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    this.underlinedTextColor = Colors.white,
    this.underlinedText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: underlinedText
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: underlinedTextColor,
                    width: 1,
                  ),
                ),
              )
            : null,
        child: Text(
          title,
          style: styleText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
