import 'package:flutter/material.dart';

import '../fencers_list_data.dart';
import '../screens/fencer_info_screen.dart';

class FencerCard extends StatelessWidget {
  final int index;

  FencerCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Theme.of(context).primaryColor,
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          splashColor: Color(0xFF2B34AC),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FencerInfoScreen(index),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${index + 1} ',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Text(
                        fencers[index].name,
                        style: Theme.of(context).textTheme.headline1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        fencers[index].victories.toString(),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        fencers[index].ts.toString(),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        fencers[index].tr.toString(),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        fencers[index].ind.toString(),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        fencers[index].pi.toString(),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
