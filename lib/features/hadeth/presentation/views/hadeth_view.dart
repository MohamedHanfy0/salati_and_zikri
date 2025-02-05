import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/assets.dart';
import 'package:islami/core/widgets/intro_app_bar_widget.dart';
import 'package:islami/core/widgets/search_bar_widget.dart';
import 'package:islami/features/hadeth/presentation/cubit/hadeth_cubit.dart';
import 'package:islami/features/hadeth/presentation/widgets/background_hadeth_widget.dart';
import 'package:islami/features/hadeth/presentation/widgets/item_books_widget.dart';
import 'package:islami/features/hadeth/presentation/widgets/list_hadeth_widget.dart';

class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  TextEditingController textEditingController = TextEditingController();
  List _hadeht = [];
  bool books = true;
  bool hadeth = false;

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
          onPressed: () {
            setState(() {
              books = true;
              hadeth = false;
            });
            textEditingController.clear();
          },
          child: Transform.rotate(
            angle: 15,
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.kBlackColor,
            ),
          ),
        ),
      ),
      body: BackGroundHadethWidget(
        widget: CustomScrollView(
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
              child: BlocBuilder<HadethCubit, HadethState>(
                builder: (context, state) {
                  if (state is HadethFailure) {
                  } else if (state is HadethLoading) {
                  } else if (state is HadethLoaded) {
                    return SearchBarWidget(
                      hintText: 'اسم الحديث',
                      icon: Assets.assetsImagesItem2,
                      seach: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            int searchNumber = int.tryParse(value) ?? 0;
                            books = false;
                            hadeth = true;
                            _hadeht = state.hadith
                                .where(
                                    (item) => item['idInBook'] == searchNumber)
                                .toList();
                          } else {
                            books = true;
                            hadeth = false;
                            _hadeht = [];
                          }
                        });
                        // searchHadeth(value);
                      },
                      controller: textEditingController,
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Visibility(
                visible: hadeth,
                child: ListHadethWIdget(
                  hadeth: _hadeht,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Visibility(
                visible: books,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 360,
                  child: BlocBuilder<HadethCubit, HadethState>(
                    builder: (context, state) {
                      if (state is HadethLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.gredient2,
                          ),
                        );
                      } else if (state is HadethFailure) {
                      } else if (state is HadethLoaded) {
                        return ListView.builder(
                            itemCount: state.chapters.length,
                            itemBuilder: (context, index) {
                              return ItemBooksWidget(
                                data: state.chapters,
                                click: () {
                                  setState(() {
                                    books = false;
                                    hadeth = true;
                                    _filterData(state.chapters[index]['id'],
                                        state.hadith);
                                  });
                                },
                                text: state.chapters[index]['arabic'],
                              );
                            });
                      }
                      return SizedBox();
                    },
                  ),
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
