
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/features/home/presentation/widgets/item_page_view_home_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewHomeWidget extends StatelessWidget {
  const PageViewHomeWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        SizedBox(
          height: 170,
          child: PageView(
            controller: pageController,
            children: [
              ItemPageViewWidget(),
              ItemPageViewWidget(),
              ItemPageViewWidget(),
            ],
          ),
        ),
        Center(
          child: SmoothPageIndicator(
            controller: pageController, // PageController
            count: 3,
            axisDirection: Axis.horizontal,
    
            effect: ExpandingDotsEffect(
              dotWidth: 10,
              dotHeight: 6,
              activeDotColor: AppColors.kPrimaryColor,
              dotColor: AppColors.kPajeColor,
            ),
          ),
        ),
      ],
    );
  }
}
