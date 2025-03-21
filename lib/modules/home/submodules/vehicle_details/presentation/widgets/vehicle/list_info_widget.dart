import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

import 'text_value_widget.dart';

class ListInfoWidget extends StatelessWidget {
  final List<String> items;

  const ListInfoWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int half = (items.length / 2).ceil();
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildList(items.sublist(0, half)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildList(items.sublist(half)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildList(List<String> list) {
    return list
        .map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: AppDimensions.small),
            child: TextValueWidget(value: item),
          ),
        )
        .toList();
  }
}
