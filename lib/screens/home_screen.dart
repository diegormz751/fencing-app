import 'package:flutter/material.dart';

import '../widgets/fencers_list_home.dart';
import '../widgets/input_home.dart';
import '../fencers_list_data.dart';
import '../models/fencer_model.dart';
import '../screens/combats_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addNewFencer(String fencer) {
    if (fencer == '') {
      return;
    }
    setState(() {
      fencers.add(FencerModel(
        id: (fencers.length + 1).toString(),
        name: fencer,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'Fencing App',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              FencersListHome(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 40,
                  ),
                ),
                onPressed: () {
                  if (fencers.length < 2) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('You need at least two fencers to start'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Confirm'),
                          ),
                        ],
                      ),
                    );
                    return;
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CombatsScreen(),
                    ),
                  );
                },
                child: Text('Empezar'),
              ),
              InputHome(_addNewFencer),
            ],
          ),
        ),
      ),
    );
  }
}
