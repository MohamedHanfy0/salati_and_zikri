import 'package:flutter/material.dart';
import 'package:islami/core/services/services_shared_preferences.dart';

import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/utils/assets.dart';
import 'package:islami/core/widgets/custom_button.dart';
import 'package:islami/core/widgets/intro_app_bar_widget.dart';
import 'package:islami/features/subha/presentation/widgets/show_dialog_azkar.dart';

class SubhaView extends StatefulWidget {
  const SubhaView({super.key});

  @override
  State<SubhaView> createState() => _SubhaViewState();
}

class _SubhaViewState extends State<SubhaView> {
  final pref = ServicesSharedPreferences();

  List<Map<String, dynamic>> azkari = [
    {'name': 'سباحن الله', 'number': 0},
    {'name': 'الحمد لله', 'number': 0},
    {'name': 'الله اكبر', 'number': 0},
    {'name': 'استغفر الله', 'number': 0},
    {'name': 'لا اله الا الله', 'number': 0},
    {'name': 'اللهم صلي علي محمد', 'number': 0},
    {'name': 'لا اله الا انت سبحانك اني كنت من الظالمين', 'number': 0},
    {'name': 'سبحان الله وبحمده سبحان الله العظيم', 'number': 0},
  ];
  List<Map<String, dynamic>> updateAzkari = [];

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
    if (pref.getAzkari().isEmpty) {
      pref.saveAzkari(azkari);
      updateAzkari.addAll(azkari);
    } else {
      updateAzkari = List<Map<String, dynamic>>.from(pref.getAzkari());

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
                        resetSubha();
                      },
                    ),
                    ButtonLabelIcon(
                      text: "اختيار الذكر",
                      icon: Icon(Icons.circle),
                      click: () {
                        showDialogAzkar(context, updateAzkari, (index) {
                          setState(() {
                            akr = '${updateAzkari[index]['name']}';
                            numberSubha = updateAzkari[index]['number'];
                            indexUp = index;
                            saveData();
                          });
                        });
                        // showAboutDialog(context: context  );
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
}
