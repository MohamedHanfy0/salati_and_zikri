import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial());
  List radio = [];

  Future<void> loadRadio() async {
    try {
      emit(RadioLoading());
      String jsonString = await rootBundle.loadString('assets/data_radio.json');
      Map jsonResponse = json.decode(jsonString);

      radio = jsonResponse['radios'];
      emit(RadioLoaded(radio: radio));
    } catch (e) {
      emit(RadioFailure());
    }
  }
}
