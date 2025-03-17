import 'package:flutter/material.dart';

class ElevatedButtonIconCustom extends StatelessWidget {
  final String title;
  final Color colorText;
  final Color backgroudColor;
  final void Function()? onPressed;
  final bool isLoading;
  final bool disable;
  final Size? size;
  final Icon icon;

  const ElevatedButtonIconCustom({
    super.key,
    required this.title,
    required this.icon,
    this.colorText = Colors.white,
    this.backgroudColor = const Color(0xff2D879B),
    required this.onPressed,
    this.isLoading = false,
    this.disable = false,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: (isLoading || disable) ? null : onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          size ?? Size(MediaQuery.of(context).size.width, 50),
        ),
        backgroundColor: disable
            ? const MaterialStatePropertyAll(Colors.blueGrey)
            : MaterialStatePropertyAll(backgroudColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        elevation: const MaterialStatePropertyAll(4),
      ),
      icon: icon,
      label: isLoading
          ? const SizedBox(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: disable ? Colors.white60 : colorText,
              ),
            ),
    );
  }
}
