import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String title;
  final Color colorText;
  final Color backgroudColor;
  final void Function()? onPressed;
  final bool isLoading;
  final bool disable;
  final Size? size;
  final Icon? icon;
  const ElevatedButtonCustom({
    super.key,
    required this.title,
    this.colorText = Colors.white,
    required this.backgroudColor,
    required this.onPressed,
    this.isLoading = false,
    this.disable = false,
    this.size,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return _body(context: context, icon: icon);
  }

  Widget _body({Icon? icon, required BuildContext context}) {
    final buttonStyle = ButtonStyle(
      fixedSize: MaterialStateProperty.all(
        size ?? Size(MediaQuery.of(context).size.width, 50),
      ),
      backgroundColor: disable
          ? const MaterialStatePropertyAll(Colors.blueGrey)
          : MaterialStatePropertyAll(backgroudColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      elevation: const MaterialStatePropertyAll(4),
      padding: MaterialStateProperty.all(
        const EdgeInsets.all(0),
      ),
    );

    final buttonContent = isLoading
        ? const SizedBox(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: disable ? Colors.white60 : colorText,
            ),
          );

    return ElevatedButton(
      onPressed: (isLoading || disable) ? null : onPressed,
      style: buttonStyle,
      child: icon != null
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 9, right: 9),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: disable ? Colors.white60 : colorText,
                    ),
                  ),
                ),
                icon,
              ],
            )
          : buttonContent,
    );
  }
}
