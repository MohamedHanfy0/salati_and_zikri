import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/services/services_shared_preferences.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/assets.dart';
import 'package:islami/core/widgets/intro_app_bar_widget.dart';
import 'package:islami/features/radio/presentation/cubit/radio_cubit.dart';
import 'package:islami/features/radio/presentation/widget/item_radio_widget.dart';
import 'package:islami/features/radio/presentation/widget/top_radio_button_widget.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
 
  
  
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String audioUrl = 'https://backup.qurango.net/radio/ahmad_alajmy';
   String activeCheck = 'radio';
  int indexOld = 0;
  List radio = [];
  final pref = ServicesSharedPreferences();
  

  

  void playAudio() {
    if (isPlaying) {
      stopAudio();
      audioPlayer.play(UrlSource(audioUrl));
      setState(() {
        isPlaying = true;
      });
    } else {
      audioPlayer.play(UrlSource(audioUrl));
      setState(() {
        isPlaying = true;
      });
    }
    audioPlayer.play(UrlSource(audioUrl));
    setState(() {
      isPlaying = true;
    });
  }

  void pauseAudio() {
    audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void stopAudio() {
    audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  
  void toggleMute(bool isMuted) {
    if (isMuted) {
      audioPlayer.setVolume(1.0);
    } else {
      audioPlayer.setVolume(0.0);
    }
  }

  updateRadioData(List radio) {
    pref.saveJsonData('radio', radio);
    
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  PageController pageController = PageController();

  

  void handlePlay(int index) {
    setState(() {
      audioUrl = radio[index]['url'];
      if (radio[index]['isPlaying'] == false) {
        radio[indexOld]['isPlaying'] = false;
        radio[index]['isPlaying'] = true;
        indexOld = index;
        playAudio();
      } else {
        radio[indexOld]['isPlaying'] = false;
        indexOld = index;

        stopAudio();
      }
      if (radio[index]['mute'] == false) {
        toggleMute(true);
      } else {
        toggleMute(false);
      }
      updateRadioData(radio);
    });
  }

  void handleLike(int index) {
    setState(() {
      if (radio[index]['like'] == false) {
        radio[index]['like'] = true;
      } else {
        radio[index]['like'] = false;
      }
      updateRadioData(radio);
    });
  }

  handleVolum(int index) {
    setState(() {
      if (radio[index]['mute'] == false) {
        radio[index]['mute'] = true;
        toggleMute(false);
      } else {
        radio[index]['mute'] = false;
        toggleMute(true);
      }
      updateRadioData(radio);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.assetsImagesBgRadio), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            IntorAppBarWidget(),
            TopRadioButtonWidget(
              activeCheck: activeCheck,
              click1: () {
                setState(() {
                  activeCheck = 'radio';
                  pageController.previousPage(
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeInOut);
                });
              },
              click2: () {
                setState(() {
                  activeCheck = 'hide';
                  pageController.nextPage(
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeInOut);
                });
              },
            ),
            Expanded(
              child: BlocBuilder<RadioCubit, RadioState>(
                builder: (context, state) {
                  if (state is RadioLoading) {
                    return CircularProgressIndicator(
                      color: AppColors.gredient2,
                    );
                  } else if (state is RadioFailure) {
                  } else if (state is RadioLoaded) {
                    radio = state.radio;
                    return PageView(
                      controller: pageController,
                      onPageChanged: (value) {
                        if (value == 0) {
                          setState(() {
                            activeCheck = 'radio';
                          });
                        } else {
                          setState(() {
                            activeCheck = 'hide';
                          });
                        }
                      },
                      children: [
                        ListView.builder(
                         
                          itemCount: radio.length,
                          itemBuilder: (context, index) => ItemRadioWidget(
                            name: radio[index]['name'],
                            play: () => handlePlay(index),
                            like: () => handleLike(index),
                            volum: () => handleVolum(index),
                            mute: radio[index]['mute'],
                            isPly: radio[index]['isPlaying'],
                            disLike: radio[index]['like'],
                          ),
                        ),
                        ListView.builder(
                          itemCount: radio.length,
                          itemBuilder: (context, index) {
                            return Visibility(
                              visible: radio[index]['like'],
                              child: ItemRadioWidget(
                                name: radio[index]['name'],
                                play: () => handlePlay(index),
                                like: () => handleLike(index),
                                volum: () => handleVolum(index),
                                mute: radio[index]['mute'],
                                isPly: radio[index]['isPlaying'],
                                disLike: radio[index]['like'],
                              ),
                            );
                          },
                        )
                      ],
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

