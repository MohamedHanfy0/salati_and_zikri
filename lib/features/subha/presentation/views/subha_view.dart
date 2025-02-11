import 'package:flutter/material.dart';
import 'package:islami/core/services/services_shared_preferences.dart';

import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/widgets/app_bar_back_and_title.dart';
import 'package:islami/core/widgets/custom_button.dart';

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
    pref.saveJsonData('azkari', updateAzkari);
  }

  updateData(int indexNumber) {
    if (pref.getJsonData('azkari').isEmpty) {
      pref.saveJsonData('azkari', azkari);
      updateAzkari.addAll(azkari);
    } else {
      updateAzkari =
          List<Map<String, dynamic>>.from(pref.getJsonData('azkari'));

      akr = updateAzkari[indexNumber]['name'];
      numberSubha = updateAzkari[indexNumber]['number'];
    }
  }

  bool showZkr = false;

  @override
  void initState() {
    updateData(0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            const SizedBox(
              height: 41,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AppBarBackAndTitle(
                title: 'التسبيح الإلكتروني',
              ),
            ),
            Visibility(visible: showZkr, child: customList()),
            Visibility(
              visible: showZkr == false ? true : false,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: AppColors.kBackgroundColor.withAlpha(100),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                        textAlign: TextAlign.center,

                       
                        akr,
                        style: AppStyle.janna36bold
                            .copyWith(color: AppColors.kPrimaryColor)),
                  ),
                  Container(
                    width: 257,
                    height: 83.15,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 100,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.12),
                        color: AppColors.kSecondaryColor),
                    child: Text(
                      numberSubha.toString(),
                      style: AppStyle.digital50regular,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 50),
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
                            setState(() {
                              showZkr = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numberSubha++;
                      });
                      saveData();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 128,
                      height: 128,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.kPrimaryColor,
                          boxShadow: [
                            BoxShadow(
                              blurStyle: BlurStyle.solid,
                              spreadRadius: 5,
                              blurRadius: 5,
                              color: AppColors.kDarkColor,
                              offset: Offset(-4, 4),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customList() {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      padding: EdgeInsets.symmetric(horizontal: 20),
      // color: AppColors.kSecondaryColor,
      child: ListView.builder(
        itemCount: updateAzkari.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                akr = '${updateAzkari[index]['name']}';
                numberSubha = updateAzkari[index]['number'];
                indexUp = index;
                showZkr = false;
                saveData();
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.kPrimaryColor),
              child: Text(
                textAlign: TextAlign.center,
                '${updateAzkari[index]['name']} ${updateAzkari[index]['number']} ',
                // maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.poppins12bold
                    .copyWith(color: AppColors.kBackgroundColor, fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
