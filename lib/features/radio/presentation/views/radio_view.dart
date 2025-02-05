import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  String activeCheck = 'radio';
  int indexOld = 0;
  // ignore: prefer_final_fields
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String audioUrl = 'https://backup.qurango.net/radio/ahmad_alajmy';

  void playAudio() {
    if (isPlaying) {
      stopAudio();
      _audioPlayer.play(UrlSource(audioUrl));
      setState(() {
        isPlaying = true;
      });
    } else {
      _audioPlayer.play(UrlSource(audioUrl));
      setState(() {
        isPlaying = true;
      });
    }
    _audioPlayer.play(UrlSource(audioUrl));
    setState(() {
      isPlaying = true;
    });
  }

  void pauseAudio() {
    _audioPlayer.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void stopAudio() {
    _audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  // bool isMuted = false;
  void toggleMute(bool isMuted) {
    if (isMuted) {
      _audioPlayer.setVolume(1.0);
    } else {
      _audioPlayer.setVolume(0.0);
    }
    // setState(() {
    //   isMuted = !isMuted;
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
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
                });
              },
              click2: () {
                setState(() {
                  activeCheck = 'hide';
                });
              },
            ),
            BlocBuilder<RadioCubit, RadioState>(
              builder: (context, state) {
                if (state is RadioLoading) {
                  return CircularProgressIndicator(
                    color: AppColors.gredient2,
                  );
                } else if (state is RadioFailure) {
                } else if (state is RadioLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.radio.length,
                      itemBuilder: (context, index) => ItemRadioWidget(
                        name: state.radio[index]['name'],
                        play: () {
                          setState(() {
                            audioUrl = state.radio[index]['url'];
                            if (state.radio[index]['isPlaying'] == false) {
                              state.radio[indexOld]['isPlaying'] = false;
                              state.radio[index]['isPlaying'] = true;
                              indexOld = index;
                              playAudio();
                            } else {
                              state.radio[indexOld]['isPlaying'] = false;
                              indexOld = index;

                              stopAudio();
                            }
                            if (state.radio[index]['mute'] == false) {
                              toggleMute(true);
                            } else {
                              toggleMute(false);
                            }
                          });
                        },
                        like: () {
                          setState(() {
                            if (state.radio[index]['like'] == false) {
                              state.radio[index]['like'] = true;
                              toggleMute(false);
                            } else {
                              state.radio[index]['like'] = false;
                              toggleMute(true);
                            }
                          });
                        },
                        volum: () {
                          setState(() {
                            if (state.radio[index]['mute'] == false) {
                              state.radio[index]['mute'] = true;
                              toggleMute(false);
                            } else {
                              state.radio[index]['mute'] = false;
                              toggleMute(true);
                            }
                          });
                        },
                        mute: state.radio[index]['mute'],
                        isPly: state.radio[index]['isPlaying'],
                        disLike: state.radio[index]['like'],
                      ),
                    ),
                  );
                }
                return SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
