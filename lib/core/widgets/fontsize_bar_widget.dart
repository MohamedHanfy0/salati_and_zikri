

import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_style.dart';

class FontSizeBarWidget extends StatelessWidget {
  const FontSizeBarWidget({
    super.key,
    required this.click1,
    required this.click2,
    required this.fontSize,
  });
  final double fontSize;
  final VoidCallback click1;
  final VoidCallback click2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: click1,
          icon: Icon(
            Icons.remove,
            color: Colors.black,
          ),
        ),
        Text(
          fontSize.toString(),
          style: AppStyle.almarai16bold,
        ),
        IconButton(
          onPressed: click2,
          icon: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}