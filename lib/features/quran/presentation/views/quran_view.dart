import 'package:flutter/material.dart';
import 'package:islami/core/services/services_shared_preferences.dart';
import 'package:quran_library/quran.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  final pref = ServicesSharedPreferences();

  @override
  void initState() {
    QuranLibrary().jumpToPage(pref.getData(key: 'suraSave') ?? 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: QuranLibraryScreen(
      onPageChanged: (int pageIndex) {
     
        setState(() {
          pref.saveData('suraSave', 1 + pageIndex);
        });
      },
    ));
  }
}
