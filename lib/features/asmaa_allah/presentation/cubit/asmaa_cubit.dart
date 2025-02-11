import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'asmaa_state.dart';

class AsmaaCubit extends Cubit<AsmaaState> {
  AsmaaCubit() : super(AsmaaInitial());

  Future<void> loadAsmaa() async {
    try {
      emit(AsmaaLoading());
      String jsonString = await rootBundle.loadString('assets/asmaa.json');
      final asmaa = json.decode(jsonString);

      emit(AsmaaLoaded(asmaa: asmaa));
    } catch (e) {
      emit(AsmaaFailure());
    }
  }
}
