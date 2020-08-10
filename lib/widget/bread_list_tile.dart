import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo22/model/indian_breads.dart';

import 'bread_item.dart';

class BreadListTile extends StatefulWidget {
  @override
  _BreadListTileState createState() => _BreadListTileState();
}

class _BreadListTileState extends State<BreadListTile> {
  @override
  Widget build(BuildContext context) {
    final breadData = Provider.of<IndianBreads>(context);
    final breads = breadData.breads;

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: breads.length,
              itemBuilder: (ctx, i) =>
                  ChangeNotifierProvider.value(value: breads[i],
                  child: BreadItem(),)),
        ),
      ],
    );
  }
}
