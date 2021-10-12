import 'package:fencing_poule/providers/fencers_provider.dart';
import "package:flutter/services.dart";
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/fencer_model.dart';

class ModalCombatScreen extends StatelessWidget {
  final FencerModel fencer1;
  final FencerModel fencer2;
  final int fencer1T;
  final int fencer2T;

  int touches1 = 0;
  int touches2 = 0;

  final form = GlobalKey<FormState>();

  ModalCombatScreen(
    this.fencer1,
    this.fencer2,
    this.fencer1T,
    this.fencer2T,
  );

  void saveForm(BuildContext ctx) {
    if (!form.currentState!.validate()) {
      return;
    }
    form.currentState!.save();
    Provider.of<FencersProvider>(
      ctx,
      listen: false,
    ).setCombat(
      fencer1: fencer1,
      fencer2: fencer2,
      touches1: touches1,
      touches2: touches2,
    );
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    final fencersData = Provider.of<FencersProvider>(
      context,
      listen: false,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: form,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '(${fencersData.fencers.indexOf(fencer1) + 1}) ${fencer1.name}',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: TextFormField(
                          initialValue: fencer1T.toString(),
                          // style: ,
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          validator: (touches) {
                            if (touches!.isEmpty) {
                              return '';
                            }
                            if (int.tryParse(touches) == null) {
                              return '';
                            }
                            if (int.parse(touches) < 0) {
                              return '';
                            }
                            return null;
                          },
                          onSaved: (touches) {
                            touches1 = int.parse(touches!);
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'vs',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '(${fencersData.fencers.indexOf(fencer2) + 1}) ${fencer2.name}',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: TextFormField(
                          initialValue: fencer2T.toString(),
                          textAlign: TextAlign.center,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          validator: (touches) {
                            if (touches!.isEmpty) {
                              return '';
                            }
                            if (int.tryParse(touches) == null) {
                              return '';
                            }
                            if (int.parse(touches) < 0) {
                              return '';
                            }
                            return null;
                          },
                          onSaved: (touches) {
                            touches2 = int.parse(touches!);
                          },
                          onFieldSubmitted: (_) => saveForm(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    saveForm(context);
                  },
                  child: Text('OK'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildTextField(BuildContext context, var fencerController) {
    return Container(
      child: TextField(
        controller: fencerController,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline4,
      ),
      width: 100,
      height: 50,
    );
  }
}
