import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/combats_screen.dart';
import '../widgets/fencers_list.dart';
import '../providers/fencers_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final fencerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //
    final fencersData = Provider.of<FencersProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  'Fencing App',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              FencersList(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 2,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  splashColor: Colors.black12,
                  onTap: () {
                    if (fencersData.fencers.length < 2) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          content: Text(
                              'Necesitas al menos 2 tiradores para empezar!'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                      return;
                    }
                    Navigator.of(context).pushNamed(CombatsScreen.route);
                    fencersData.generateCombats();
                  },
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 90,
                    color: Colors.black,
                  ),
                ),
              ),
              TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: fencerController,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                onSubmitted: (_) {
                  if (fencerController.text.trim().isEmpty) {
                    return;
                  }
                  fencersData.addFencer(fencerController.text.trim());
                  fencerController.clear();
                },
                decoration: InputDecoration(
                  labelText: 'Añadir tirador',
                  fillColor: Colors.white,
                  filled: true,
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (fencerController.text.trim().isEmpty) {
                        return;
                      }
                      fencersData.addFencer(fencerController.text.trim());
                      fencerController.clear();
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
