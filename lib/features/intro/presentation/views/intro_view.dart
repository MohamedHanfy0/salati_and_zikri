import 'package:flutter/material.dart';
import 'package:islami/features/intro/presentation/widgets/intor_page_view.dart';
import 'package:islami/core/widgets/intro_app_bar_widget.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 57,
              ),
            ),
            SliverToBoxAdapter(
              child: IntorAppBarWidget(),
            ),
            SliverToBoxAdapter(
              child: IntroPageView(),
            )
          ],
        ),
      ),
    );
  }
}
