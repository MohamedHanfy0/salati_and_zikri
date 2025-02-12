import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';
import 'package:islami/core/widgets/app_bar_back_and_title.dart';
import 'package:islami/core/widgets/fontsize_bar_widget.dart';
import 'package:islami/features/hadeth/presentation/cubit/hadeth_cubit.dart';
import 'package:islami/features/hadeth/presentation/widgets/floating_button_hadeth_widget.dart';

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
      floatingActionButton: FloatinButtonHadethWidget(
        hadeth: hadeth,
        click: () {
          setState(() {
            hadeth = false;
          });
          textEditingController.clear();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 24, right: 24),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AppBarBackAndTitle(title: 'الأحاديث'),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
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
                              height: MediaQuery.of(context).size.height - 100,
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
                                                textDirection:
                                                    TextDirection.rtl,
                                                '  ${_hadeht.length} حديث',
                                                style: AppStyle.almarai16bold
                                                    .copyWith(
                                                        fontSize: 14,
                                                        color: AppColors
                                                            .kPrimaryColor),
                                              ),
                                              FontSizeBarWidget(
                                                fontSize: fontSize,
                                                click1: () {
                                                  setState(() {
                                                    fontSize > 9
                                                        ? fontSize--
                                                        : fontSize = 9;
                                                  });
                                                },
                                                click2: () {
                                                  setState(() {
                                                    fontSize < 50
                                                        ? fontSize++
                                                        : fontSize = 50;
                                                    fontSize++;
                                                  });
                                                },
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
                              height: MediaQuery.of(context).size.height - 100,
                              child: ListView.builder(
                                itemCount: state.chapters.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        hadeth = true;
                                        _filterData(state.chapters[index]['id'],
                                            state.hadeth);
                                      });
                                    },
                                    child: Container(
                                      height: 72,
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              Assets.assetsImagesBackground),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 10),
                                        height: double.infinity,
                                        width: double.infinity,
                                        // color: AppColors.kDarkColor,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: AppColors.kPrimaryColor,
                                        ),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          state.chapters[index]['arabic'],
                                          style: AppStyle.almarai16bold
                                              .copyWith(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
            // SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 10,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
