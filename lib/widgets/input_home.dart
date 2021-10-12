import 'package:flutter/material.dart';

class InputHome extends StatelessWidget {
  final controller = TextEditingController();
  final Function addNewFencer;

  InputHome(this.addNewFencer);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (_) {
        addNewFencer(controller.text);
        controller.clear();
      },
      controller: controller,
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
            addNewFencer(controller.text);
            controller.clear();
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
