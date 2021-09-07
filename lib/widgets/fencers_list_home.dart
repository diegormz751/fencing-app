import 'package:flutter/material.dart';

import '../fencers_list_data.dart';

class FencersListHome extends StatefulWidget {
  @override
  _FencersListHomeState createState() => _FencersListHomeState();
}

class _FencersListHomeState extends State<FencersListHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 250,
      child: ListView.builder(
        itemCount: fencers.length,
        itemBuilder: (ctx, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${index + 1} ',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                // flex: 2,
                child: Text(
                  fencers[index].name,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  // overflow: TextOverflow.,
                  // softWrap: false,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    fencers.removeAt(index);
                  });
                },
                icon: Icon(Icons.clear),
              )
            ],
          );
        },
      ),
    );
  }
}
