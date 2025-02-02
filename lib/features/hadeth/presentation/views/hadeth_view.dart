import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';
import 'package:islami/core/widgets/intro_app_bar_widget.dart';
import 'package:islami/core/widgets/search_bar_widget.dart';
import 'package:islami/features/hadeth/presentation/widgets/background_hadeth_widget.dart';

class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  List _data = [];
  List _hadeht = [];
  List filterHadeth = [];
  Map jsonResponse = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    String jsonString = await rootBundle.loadString('assets/muslim.json');
    jsonResponse = json.decode(jsonString);
    setState(() {
      _data = jsonResponse['chapters'];
    });
  }

  // ignore: unused_element
  void _filterData(int index) {
    setState(() {
      filterHadeth = jsonResponse['hadiths'];
      _hadeht =
          filterHadeth.where((item) => item['chapterId'] == index).toList();
    });
  }

  bool books = true;
  bool hadeth = false;

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
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlackColor,
          ),
        ),
      ),
      body: BackGroundHadethWidget(
        widget: Column(
          children: [
            SizedBox(
              height: 57,
            ),
            IntorAppBarWidget(),
            SearchBarWidget(
              hintText: 'اسم الحديث',
              icon: Assets.assetsImagesItem2,
            ),
            Visibility(
                visible: hadeth,
                child: ListHadethWIdget(
                  hadeth: _hadeht,
                )),
            Visibility(
              visible: books,
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 360,
                child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _filterData(_data[index]['id']);
                          books = false;
                          hadeth = true;
                        });
                      },
                      child: Container(
                        height: 55,
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1, color: AppColors.gredient2)),
                        child: Text(_data[index]['arabic'],
                            style: AppStyle.janna24bold.copyWith(fontSize: 20)),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class ListHadethWIdget extends StatelessWidget {
  final List hadeth;
  const ListHadethWIdget({
    super.key,
    required this.hadeth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height - 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // semanticChildCount: 2,
        itemCount: hadeth.length,
        itemBuilder: (context, index) {
          return itemHadethWidget(
            textHadeth: hadeth[index]['arabic'],
            numberHadeth: hadeth[index]['idInBook'],
          );
        },
      ),
    );
  }
}

// ignore: camel_case_types
class itemHadethWidget extends StatelessWidget {
  final String textHadeth;
  final int numberHadeth;
  const itemHadethWidget({
    super.key,
    required this.textHadeth,
    required this.numberHadeth,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 313,
        decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.8,
                image: AssetImage(Assets.assetsImagesHadithCardBackGround)),
            borderRadius: BorderRadius.circular(20),
            color: AppColors.kGoldColor),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                Assets.assetsImagesMosquBottom,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              // right: 0,
              left: 10,
              top: 10,
              child: Image.asset(
                Assets.assetsImagesCornerr1,
                width: 92,
                height: 93,
              ),
            ),
            Positioned(
              top: 40,
              right: 0,
              left: 0,
              child: Text(
                textAlign: TextAlign.center,
                '$numberHadeth رقم الحديث',
                style:
                    AppStyle.janna24bold.copyWith(color: AppColors.kBlackColor),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Image.asset(
                Assets.assetsImagesCornerr2,
                width: 93,
                height: 92,
              ),
            ),
            Positioned(
              top: 105,
              left: 15,
              right: 15,
              child: Text(
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 15,
                textHadeth,
                style: AppStyle.janna18bold
                    .copyWith(color: AppColors.kBlackColor, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
