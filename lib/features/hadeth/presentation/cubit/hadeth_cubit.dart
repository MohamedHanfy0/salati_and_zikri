import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'hadeth_state.dart';

class HadethCubit extends Cubit<HadethState> {
  HadethCubit() : super(HadethInitial());

  Future<void> loadHaiths() async {
    try {
      emit(HadethLoading());
      String jsonString = await rootBundle.loadString('assets/muslim.json');
      Map jsonResponse = json.decode(jsonString);
      List chapters = jsonResponse['chapters'];
      List hadiths = jsonResponse['hadiths'];
      emit(HadethLoaded(chapters: chapters, hadith: hadiths,));
    } catch (e) {
      emit(HadethFailure());
    }
  }
}
