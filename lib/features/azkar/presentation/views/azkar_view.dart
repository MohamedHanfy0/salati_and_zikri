import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/widgets/app_bar_back_and_title.dart';
import 'package:islami/core/widgets/fontsize_bar_widget.dart';
import 'package:islami/features/azkar/presentation/cubit/azkari_cubit.dart';
import 'package:islami/features/hadeth/presentation/widgets/floating_button_hadeth_widget.dart';

class AzkarView extends StatefulWidget {
  const AzkarView({super.key});

  @override
  State<AzkarView> createState() => _AzkarViewState();
}

class _AzkarViewState extends State<AzkarView> {
  List arry = [];
  bool isVisibilty = false;
  double fontSize = 18;
  String title = 'الاذكار';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatinButtonHadethWidget(
          hadeth: isVisibilty,
          click: () {
            setState(() {
              title = 'الاذكار';
              isVisibilty = false;
            });
          }),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
              child: Column(
                children: [
                  AppBarBackAndTitle(
                    title: title,
                    widget: FontSizeBarWidget(
                        click1: () {
                          setState(() {
                            fontSize > 18 ? fontSize-- : fontSize = 18;
                          });
                        },
                        click2: () {
                          setState(() {
                            fontSize < 33 ? fontSize++ : fontSize = 33;
                          });
                        },
                        fontSize: fontSize),
                  ),
                  BlocBuilder<AzkariCubit, AzkariState>(
                    builder: (context, state) {
                      if (state is AzkariFailure) {
                      } else if (state is AzkariLoading) {
                      } else if (state is AzkariLoaded) {
                        return Column(
                          children: [
                            Visibility(
                              visible: isVisibilty == false ? true : false,
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 100,
                                child: ListView.builder(
                                    itemCount: state.azkari.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            title =
                                                state.azkari[index]['category'];
                                            arry = state.azkari[index]['array'];
                                            isVisibilty = true;
                                          });
                                        },
                                        child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          height: 77,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: AppColors.kPajeColor),
                                          child: Text(
                                            state.azkari[index]['category'],
                                            style: AppStyle.almarai16bold,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            Visibility(
                              visible: isVisibilty,
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 100,
                                child: ListView.builder(
                                    itemCount: arry.length,
                                    itemBuilder: (context, index) {
                                      return ItemZekrCount(
                                        text: arry[index]['text'],
                                        count: arry[index]['count'],
                                        click: () {
                                          //
                                          setState(() {
                                            arry[index]['count'] > 0
                                                ? arry[index]['count'] =
                                                    arry[index]['count'] - 1
                                                : arry[index]['count'];
                                          });
                                        },
                                        fontSized: fontSize,
                                      );
                                    }),
                              ),
                            ),
                          ],
                        );
                      }
                      return SizedBox();
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemZekrCount extends StatelessWidget {
  const ItemZekrCount({
    super.key,
    required this.text,
    required this.count,
    required this.click,
    required this.fontSized,
  });

  final String text;
  final int count;
  final VoidCallback click;
  final double fontSized;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Stack(
        children: [
          Opacity(
            opacity: count == 0 ? 0.6 : 1,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.kSecondaryColor.withAlpha(150)),
              child: Column(
                spacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(text,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: AppColors.kDarkColor,
                            fontSize: fontSized,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.kPrimaryColor),
                    child: Text(
                      count.toString(),
                      style: AppStyle.almarai16bold
                          .copyWith(color: AppColors.kCardContentColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
