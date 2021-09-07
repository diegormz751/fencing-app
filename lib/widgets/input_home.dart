import 'package:flutter/material.dart';

class InputHome extends StatefulWidget {
  final Function addNewFencer;

  InputHome(this.addNewFencer);

  @override
  _InputHomeState createState() => _InputHomeState();
}

class _InputHomeState extends State<InputHome> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (_) {
        widget.addNewFencer(_controller.text);
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
            widget.addNewFencer(_controller.text);
            _controller.clear();
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
