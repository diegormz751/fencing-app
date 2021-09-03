import 'package:flutter/material.dart';

import '../models/fencer_model.dart';
import '../fencers_list_data.dart';

class InputHome extends StatefulWidget {
  @override
  _InputHomeState createState() => _InputHomeState();
}

class _InputHomeState extends State<InputHome> {
  final _controller = TextEditingController();

  void _addNewFencer() {
    if (_controller.text == '') {
      return;
    }
    setState(() {
      fencers.add(FencerModel(
        id: (fencers.length + 1).toString(),
        name: _controller.text,
      ));
    });
    print(fencers);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (_) {
        _addNewFencer();
        _controller.clear();
      },
      controller: _controller,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: 'Add Fencer',
        labelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          onPressed: () {
            _addNewFencer();
            _controller.clear();
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
