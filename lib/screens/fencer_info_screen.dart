import 'package:flutter/material.dart';

import '../fencers_list_data.dart';
import '../widgets/combats_grid.dart';

class FencerInfoScreen extends StatelessWidget {
  final int index;

  FencerInfoScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fencers[index].name),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CombatsGrid(index),
        // child: Center(child: Text(fencers[index].name)),
      ),
    );
  }
}
