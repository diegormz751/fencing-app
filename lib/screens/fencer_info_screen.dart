import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/modal_combat_screen.dart';
import '../providers/fencers_provider.dart';
import '../models/fencer_model.dart';

class FencerInfoScreen extends StatelessWidget {
  // static const route = '/fencer-info-screen';
  final FencerModel mainFencer;
  final int fencerNumber;

  const FencerInfoScreen({
    required this.mainFencer,
    required this.fencerNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final fencersData = Provider.of<FencersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('${fencerNumber + 1} ${mainFencer.name}'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          ...fencersData.fencers.where((fencer) {
            return fencer != mainFencer;
          }).map(
            (fencer) {
              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    showDialogC(
                      context,
                      mainFencer,
                      fencer,
                      fencersData.combats[mainFencer]![
                          fencersData.fencers.indexOf(fencer)],
                      fencersData.combats[fencer]![
                          fencersData.fencers.indexOf(mainFencer)],
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'VS',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        '(${fencersData.fencers.indexOf(fencer) + 1}) ${fencer.name}',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      if (fencersData.combats[fencer]![
                              fencersData.fencers.indexOf(mainFencer)] <
                          fencersData.combats[mainFencer]![
                              fencersData.fencers.indexOf(fencer)])
                        resultText(
                          fencersData.combats[mainFencer]![
                                  fencersData.fencers.indexOf(fencer)]
                              .toString(),
                          Colors.green,
                        )
                      else if (fencersData.combats[fencer]![
                              fencersData.fencers.indexOf(mainFencer)] >
                          fencersData.combats[mainFencer]![
                              fencersData.fencers.indexOf(fencer)])
                        resultText(
                          fencersData.combats[mainFencer]![
                                  fencersData.fencers.indexOf(fencer)]
                              .toString(),
                          Colors.red,
                        )
                      else
                        resultText(
                          fencersData.combats[mainFencer]![
                                  fencersData.fencers.indexOf(fencer)]
                              .toString(),
                          Colors.yellow,
                        ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget resultText(String number, Color bgColor) {
    return Text(
      '  $number  ',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        backgroundColor: bgColor,
      ),
    );
  }

  void showDialogC(
    BuildContext ctx,
    FencerModel fencer1,
    FencerModel fencer2,
    int fencer1T,
    int fencer2T,
  ) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 200),
      context: ctx,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 300,
            margin: EdgeInsets.only(top: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: ModalCombatScreen(
              fencer1,
              fencer2,
              fencer1T,
              fencer2T,
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}
