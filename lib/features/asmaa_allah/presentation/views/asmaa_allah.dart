import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_style.dart';
import 'package:islami/core/widgets/app_bar_back_and_title.dart';
import 'package:islami/features/asmaa_allah/presentation/cubit/asmaa_cubit.dart';

class AsmaaAllah extends StatefulWidget {
  const AsmaaAllah({super.key});

  @override
  State<AsmaaAllah> createState() => _AsmaaAllahState();
}

class _AsmaaAllahState extends State<AsmaaAllah> {
  PageController pageController = PageController();
  double fontSize = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: Column(
          children: [
            AppBarBackAndTitle(title: 'أسماء الله الحسني'),
            Center(
              child: BlocBuilder<AsmaaCubit, AsmaaState>(
                builder: (context, state) {
                  if (state is AsmaaFailure) {}
                  if (state is AsmaaLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kPrimaryColor,
                      ),
                    );
                  }
                  if (state is AsmaaLoaded) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 150,
                      child: PageView.builder(
                          controller: pageController,
                          itemCount: state.asmaa.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' الاسم ${1 + index}',
                                        style: AppStyle.almarai16bold.copyWith(
                                            fontSize: 14,
                                            color: AppColors.kPrimaryColor),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                fontSize > 9
                                                    ? fontSize--
                                                    : fontSize = 9;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            fontSize.toString(),
                                            style: AppStyle.almarai16bold,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                fontSize < 50
                                                    ? fontSize++
                                                    : fontSize = 50;
                                                fontSize++;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  '${state.asmaa[index]['name']}',
                                  style: TextStyle(
                                    fontSize: 55,
                                    color: AppColors.kPrimaryColor,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 5,
                                        color: AppColors.kCardContentColor,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: AppColors.kSecondaryColor,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: SizedBox(
                                    child: SizedBox(
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        '${state.asmaa[index]['text']} ',
                                        style: TextStyle(
                                            fontSize: fontSize,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
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
