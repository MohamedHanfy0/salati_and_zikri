import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/features/hadeth/presentation/cubit/hadeth_cubit.dart';

class HadethPreviewView extends StatelessWidget {
  final List hadeth;
  final int number;
  const HadethPreviewView(
      {super.key, required this.hadeth, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HadethCubit, HadethState>(
        builder: (context, state) {
          return PageView(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.kDarkColor,
                ),
                child: Text(''),
              )
            ],
          );
        },
      ),
    );
  }
}
