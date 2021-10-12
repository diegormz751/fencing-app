import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/fencers_provider.dart';

class FencersList extends StatelessWidget {
  const FencersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final fencersData = Provider.of<FencersProvider>(context);

    return Container(
      height: MediaQuery.of(context).viewInsets.bottom > 0
          ? MediaQuery.of(context).size.height * 0.3 - 100
          : MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListView.builder(
        itemCount: fencersData.fencers.length,
        itemBuilder: (ctx, i) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${i + 1}  ${fencersData.fencers[i].name}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  fencersData.removeFencer(i);
                },
                icon: Icon(Icons.close),
              )
            ],
          );
        },
      ),
    );
  }
}
