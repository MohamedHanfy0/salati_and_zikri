import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'hadeth_state.dart';

class HadethCubit extends Cubit<HadethState> {
  HadethCubit() : super(HadethInitial());

  Future<void> loadChapters() async {
    try {
      emit(HadethLoading());
      String jsonString =
          await rootBundle.loadString('assets/hadeth/chapters.json');
      Map jsonResponse = json.decode(jsonString);
      List chapters = jsonResponse['chapters'];
      emit(HadethLoaded(hadeth: [], chapters: chapters));
      
      String jsonString1 =
          await rootBundle.loadString('assets/hadeth/hadiths.json');
      Map jsonResponse1 = json.decode(jsonString1);
      List hadeth = jsonResponse1['hadiths'];

      emit(HadethLoaded(chapters: chapters, hadeth: hadeth));
    } catch (e) {
      emit(HadethFailure());
    }
  }
}
