import 'package:flutter/material.dart';

class BodyCustom extends StatelessWidget {
  final Widget body;
  const BodyCustom({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 31, right: 31),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: body,
    );
  }
}
