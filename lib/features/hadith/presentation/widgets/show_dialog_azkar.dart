import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';

Future<void> showDialogAzkar(
    BuildContext context, List<Map<String, dynamic>> updateAzkari, Function saveData) {
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.kBlackColor.withAlpha(0)),
              child: ListView.builder(
                itemCount: updateAzkari.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Set the selected azkar
                      saveData(index);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.gredient1,
                              AppColors.gredient2,
                            ],
                          )),
                      child: Text(
                        textAlign: TextAlign.center,
                        '${updateAzkari[index]['name']} ${updateAzkari[index]['number']} ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyle.janna18bold
                            .copyWith(color: AppColors.kBlackColor),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
