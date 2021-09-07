import 'package:flutter/material.dart';

import '../fencers_list_data.dart';
import '../widgets/fencer_card.dart';

class CombatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Are you sure want to leave?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  willLeave = true;
                  Navigator.of(context).pop();
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('No'),
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
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '# ',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          'Name',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.50,
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
                            'IND',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'PI',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: fencers.length,
                  itemBuilder: (ctx, index) {
                    return FencerCard(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
