import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'azkari_state.dart';

class AzkariCubit extends Cubit<AzkariState> {
  AzkariCubit() : super(AzkariInitial());

  List zkr = [];

  Future<void> loadAzkari() async {
    try {
      emit(AzkariLoading());
      String jsonString =
          await rootBundle.loadString('assets/azkar/azkar_elsbah_walmsaa.json');
      List zkr = json.decode(jsonString);

      emit(AzkariLoaded(azkari: zkr));
      String jsonString2 =
          await rootBundle.loadString('assets/azkar/azkari.json');
       zkr.addAll(json.decode(jsonString2)) ;
        String jsonString3 =
          await rootBundle.loadString('assets/azkar/azkari2.json');
       zkr.addAll(json.decode(jsonString3)) ;
       emit(AzkariLoaded(azkari: zkr));
    } catch (e) {
      emit(AzkariFailure());
    }
  }
}
