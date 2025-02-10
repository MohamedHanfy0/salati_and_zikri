import 'package:flutter/material.dart';
import 'package:islami/features/hadeth/presentation/widgets/item_hadeth_widget.dart';

class ListHadethWIdget extends StatelessWidget {
  final List hadeth;
  const ListHadethWIdget({
    super.key,
    required this.hadeth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      // height: MediaQuery.of(context).size.height - 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // semanticChildCount: 2,
        reverse: true,
        itemCount: hadeth.length,
        itemBuilder: (context, index) {
          return ItemHadethWidget(
            textHadeth: hadeth[index]['arabic'],
            numberHadeth: hadeth[index]['idInBook'],
          );
        },
      ),
    );
  }
}
