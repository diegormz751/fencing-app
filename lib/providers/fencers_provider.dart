import 'package:flutter/material.dart';

import '../models/fencer_model.dart';

class FencersProvider with ChangeNotifier {
  List<FencerModel> _fencers = [];

  Map<FencerModel, List> _combats = {};

  List<FencerModel> places = [];

  Map<FencerModel, List<bool>> victories = {};

  List<FencerModel> get fencers => [..._fencers];

  Map<FencerModel, List> get combats => {..._combats};

  void addFencer(String fencerName) {
    _fencers.add(FencerModel(name: fencerName));
    notifyListeners();
  }

  void generateCombats() {
    _combats = {};
    fencers.forEach((fencer) {
      _combats[fencer] = List.filled(fencers.length, 0);
      victories[fencer] = List.filled(fencers.length, false);
    });
    updateInfo();
  }

  void removeFencer(int index) {
    _fencers.removeAt(index);
    notifyListeners();
    updateInfo();
  }

  void setCombat({
    required FencerModel fencer1,
    required FencerModel fencer2,
    required int touches1,
    required int touches2,
  }) {
    combats[fencer1]![fencers.indexOf(fencer2)] = touches1;
    combats[fencer2]![fencers.indexOf(fencer1)] = touches2;

    if (touches1 > touches2) {
      victories[fencer1]![fencers.indexOf(fencer2)] = true;
      victories[fencer2]![fencers.indexOf(fencer1)] = false;
    } else if (touches1 < touches2) {
      victories[fencer2]![fencers.indexOf(fencer1)] = true;
      victories[fencer1]![fencers.indexOf(fencer2)] = false;
    }
    updateInfo();
  }

  void sortPlaces() {}

  void updateInfo() {
    fencers.forEach((fencer) {
      num tr = 0;
      fencers.where((fencerWhere) => fencerWhere != fencer).forEach((element) {
        var num = _combats[element]![fencers.indexOf(fencer)];
        tr += num;
      });
      fencer.toquesDados = _combats[fencer]!.reduce((a, b) => a + b);
      fencer.toquesRecibidos = tr.toInt();
      fencer.indice = fencer.toquesDados - fencer.toquesRecibidos;
    });
    lugares();
    victorias();
    notifyListeners();
  }

  void victorias() {
    fencers.forEach((fencer) {
      var v = 0;
      fencers.where((fencerWhere) => fencer != fencerWhere).forEach((element) {
        if (victories[fencer]![fencers.indexOf(element)]) {
          v++;
        }
        print('${element.name} $v');
      });
      fencer.victories = v;
    });
  }

  void lugares() {
    places = fencers;
    places.sort((f1, f2) => f1.indice.compareTo(f2.indice));
    _fencers.forEach((fencer) {
      fencer.place = places.reversed.toList().indexOf(fencer) + 1;
    });
  }
}
