import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_style.dart';

class MostRecently extends StatelessWidget {
  final String name;
  const MostRecently({
    super.key, required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.only(top: 20, bottom: 10, right: 20),
      child: Text(
       name,
        style: AppStyle.janna18bold.copyWith(color: Colors.white),
      ),
    );
  }
}
