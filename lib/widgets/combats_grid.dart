import 'package:flutter/material.dart';

import '../fencers_list_data.dart';

class CombatsGrid extends StatelessWidget {
  final int number;

  CombatsGrid(this.number);

  @override
  Widget build(BuildContext context) {
    var fen = [...fencers];

    fen.removeAt(number);

    // return GridView.builder(
    //   itemCount: fen.length,
    //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //     maxCrossAxisExtent: 200,
    //     // childAspectRatio: 1.5,
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 10,
    //   ),
    //   itemBuilder: (ctx, index) {
    //     return Container(
    //       // margin: EdgeInsets.all(10),
    //       decoration: BoxDecoration(
    //         color: Theme.of(context).accentColor,
    //       ),
    //       child: Text(fen[index].name),
    //     );
    //   },
    // );
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      children: [
        ...fen.map((fencer) {
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Text(
                  'vs',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  '(${fen.indexOf(fencer) + 1}) ${fencer.name}',
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        }).toList()
      ],
    );
  }
}
