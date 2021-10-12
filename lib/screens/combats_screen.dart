import 'package:fencing_poule/widgets/fencers_combats_list.dart';
import 'package:flutter/material.dart';

class CombatsScreen extends StatelessWidget {
  const CombatsScreen({Key? key}) : super(key: key);

  static const route = '/combats-screen';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        // show the confirm dialog
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('¿Seguro que quieres salir?'),
            actions: [
              ElevatedButton(
                child: Text('Sí'),
                onPressed: () {
                  Navigator.of(context).pop();
                  willLeave = true;
                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                  willLeave = false;
                },
              ),
            ],
          ),
        );
        return willLeave;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 0,
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140,
                      child: Text(
                        '#  Nombre',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'V',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'TS',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'TR',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'Ind',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'PL',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FencersCombatsList(),
            ],
          ),
        ),
      ),
    );
  }
}
