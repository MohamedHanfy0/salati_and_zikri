import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/services/services_shared_preferences.dart';
import 'package:meta/meta.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial());

  List radio = [];
  final pref = ServicesSharedPreferences();

  Future<void> loadRadio() async {
    if (pref.getJsonData('radio').isEmpty) {
      try {
        log('start');
        emit(RadioLoading());

        String jsonString =
            await rootBundle.loadString('assets/data_radio.json');
        print(jsonString);
        Map jsonResponse = json.decode(jsonString);

        radio = jsonResponse['radios'];
        await pref.saveJsonData('radio', radio);
        emit(RadioLoaded(radio: radio));
      } catch (e) {
        emit(RadioFailure());
      }
    } else {
      try {
        emit(RadioLoading());
        radio = await pref.getJsonData('radio');
        emit(RadioLoaded(radio: radio));
      } catch (e) {
        emit(RadioFailure());
      }
    }
  }
}
