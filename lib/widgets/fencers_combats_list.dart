import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/fencer_info_screen.dart';
import '../providers/fencers_provider.dart';

class FencersCombatsList extends StatelessWidget {
  const FencersCombatsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final fencersData = Provider.of<FencersProvider>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: fencersData.fencers.length,
        itemBuilder: (ctx, i) {
          final fencer = fencersData.fencers[i];
          return Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => FencerInfoScreen(
                      mainFencer: fencer,
                      fencerNumber: i,
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 140,
                    child: Text(
                      '${i + 1}  ${fencer.name}',
                      style: Theme.of(context).textTheme.headline1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${fencer.victories}',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          '${fencer.toquesDados}',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          '${fencer.toquesRecibidos}',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          '${fencer.indice}',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          '${fencer.place}',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
