


import 'package:flutter/material.dart';
import 'package:islami/features/hadeth/presentation/widgets/app_bar_hadeth_widget.dart';

class HadethPreviewView extends StatelessWidget {
  final String text;
  final int number;
  const HadethPreviewView({super.key, required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    return AppBarHadethWidget(numberHadeth: number, textHadeth: text,);
  }
}