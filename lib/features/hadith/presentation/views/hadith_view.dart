import 'package:flutter/material.dart';
import 'package:islami/core/services/services_shared_preferences.dart';

import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';
import 'package:islami/core/widgets/custom_button.dart';
import 'package:islami/core/widgets/intro_app_bar_widget.dart';
import 'package:islami/features/hadith/model/azkari_model.dart';

class HadithView extends StatefulWidget {
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  final pref = ServicesSharedPreferences();
  List<Map<String, dynamic>> updateAzkari = [];
  List<Map<String, dynamic>> azkari = [
    {'name': 'سباحن الله', 'number': 0},
    {'name': 'الحمد لله', 'number': 0},
    {'name': 'الله اكبر', 'number': 0},
    {'name': 'استغفر الله', 'number': 0},
    {'name': 'لا اله الا الله', 'number': 0},
    {'name': 'اللهم صلي علي محمد', 'number': 0},
    {'name': 'لا اله الا انت سبحانك اني كنت من الظالمين', 'number': 0},
    {'name': 'سبحان الله وبحمده سبحان الله العظيم', 'number': 0},
    {'name': 'سباحن الله', 'number': 0},
    {'name': 'سباحن الله', 'number': 0},
  ];
  int indexUp = 0;
  String akr = 'سباحن الله';
  int numberSubha = 0;
  void resetSubha() {
    setState(() {
      numberSubha = 0;
      saveData();
    });
  }

  saveData() {
    updateAzkari[indexUp]['number'] = numberSubha;
    pref.saveAzkari(updateAzkari);
  }

  updateData(int indexNumber) {
    if (pref.getAzkari() != null) {
      pref.saveAzkari(azkari);
    } else {
      updateAzkari = pref.getAzkari();
      akr = updateAzkari[indexNumber]['name'];
      numberSubha = updateAzkari[indexNumber]['number'];
    }
  }

  @override
  void initState() {
    updateData(0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.assetsImagesSebhaBackground),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 57,
            ),
            const IntorAppBarWidget(),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: AppColors.kBlackColor.withAlpha(100),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                textAlign: TextAlign.center,

                // "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                akr,
                style: AppStyle.janna36bold.copyWith(
                  fontSize: 30,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: AppColors.gredient2,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonLabelIcon(
                      text: "",
                      icon: Icon(Icons.restart_alt_outlined),
                      click: () {
                        setState(() {
                          numberSubha = 0;
                        });
                      },
                    ),
                    ButtonLabelIcon(
                      text: "اختيار الذكر",
                      icon: Icon(Icons.circle),
                      click: () {
                        showDialogAzkar(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    numberSubha++;
                  });
                  saveData();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 222,
                  height: 222,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.assetsImagesSebha))),
                  child: Text(
                    numberSubha.toString(),
                    style: AppStyle.janna36bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showDialogAzkar(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.gredient2),
                    child: Icon(Icons.close)),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 80,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 20),
                // height: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.kBlackColor.withAlpha(0)),
                child: ListView.builder(
                    itemCount: azkari.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            akr = azkari[index]['name'];
                            indexUp = index;
                            updateData(index);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              // color: AppColors.kGoldColor,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.gredient1,
                                  AppColors.gredient2,
                                ],
                              )),
                          child: Text(
                            textAlign: TextAlign.center,
                            azkari[index]['name'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.janna18bold
                                .copyWith(color: AppColors.kBlackColor),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
