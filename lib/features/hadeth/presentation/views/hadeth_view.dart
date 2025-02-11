import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/widgets/app_bar_back_and_title.dart';
import 'package:islami/features/hadeth/presentation/cubit/hadeth_cubit.dart';
import 'package:islami/features/hadeth/presentation/views/hadeth_preview_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  TextEditingController textEditingController = TextEditingController();
  int indexHadeth = 0;

  // bool books = true;
  bool hadeth = false;
  double fontSize = 20;
  PageController pageController = PageController();
  List _hadeht = [];
  void _filterData(int index, List hadiths) {
    setState(() {
      _hadeht = hadiths.where((item) => item['chapterId'] == index).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: hadeth,
        child: FloatingActionButton(
          splashColor: AppColors.kSecondaryColor,
          backgroundColor: AppColors.kPrimaryColor,
          onPressed: () {
            setState(() {
              hadeth = false;
            });
            textEditingController.clear();
          },
          child: Transform.rotate(
            angle: 15,
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.kBackgroundColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 57, left: 24, right: 24),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppBarBackAndTitle(title: 'الأحاديث'),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                child: BlocBuilder<HadethCubit, HadethState>(
                  builder: (context, state) {
                    if (state is HadethLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        ),
                      );
                    } else if (state is HadethFailure) {
                    } else if (state is HadethLoaded) {
                      return Column(
                        children: [
                          Visibility(
                            visible: hadeth,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height - 150,
                              child: PageView.builder(
                                  controller: pageController,
                                  itemCount: _hadeht.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${_hadeht.length} أدعية',
                                                style: AppStyle.almarai16bold
                                                    .copyWith(
                                                        fontSize: 14,
                                                        color: AppColors
                                                            .kPrimaryColor),
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        fontSize > 9
                                                            ? fontSize--
                                                            : fontSize = 9;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.remove,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    fontSize.toString(),
                                                    style:
                                                        AppStyle.almarai16bold,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        fontSize < 50
                                                            ? fontSize++
                                                            : fontSize = 50;
                                                        fontSize++;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: AppColors.kSecondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height -
                                                250,
                                            child: CustomScrollView(
                                              slivers: [
                                                SliverToBoxAdapter(
                                                  child: SizedBox(
                                                    child: Text(
                                                      textAlign: TextAlign.end,
                                                      '${_hadeht[index]['arabic']} ',
                                                      style: TextStyle(
                                                          fontSize: fontSize,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ),
                          Visibility(
                            visible: hadeth == false ? true : false,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height - 150,
                              child: GridView.builder(
                                // reverse: true,
                                itemCount: state.chapters.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        hadeth = true;
                                        _filterData(state.chapters[index]['id'],
                                            state.hadith);
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.kDarkColor,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        spacing: 15,
                                        children: [
                                          Icon(
                                            Icons.menu_book_outlined,
                                            size: 50,
                                            color: Color(0xffF8F8F8),
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            state.chapters[index]['arabic'],
                                            style: AppStyle.almarai16bold
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: AppColors
                                                        .kSecondaryColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
