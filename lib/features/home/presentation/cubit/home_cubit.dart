import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

 
  Future<void> loadJsonAsset() async {
    try {
      emit(HomeLoading());
      final String jsonString =
          await rootBundle.loadString('assets/surahs.json');
      List data = jsonDecode(jsonString);
      emit(HomeLoaded(quran: data));
    } catch (e) {
      emit(HomeFailure());
    }
  }
}
