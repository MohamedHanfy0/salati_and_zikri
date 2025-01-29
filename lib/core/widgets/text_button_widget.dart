

import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_style.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback click;
  final String text;
  const TextButtonWidget({
    super.key,
    required this.click, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Text(
       text,
        style: AppStyle.janna18bold.copyWith(fontSize: 16),
      ),
    );
  }
}
