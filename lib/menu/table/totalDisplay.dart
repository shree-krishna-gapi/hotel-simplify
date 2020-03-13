import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import '../services/scopedModel.dart';
class TotalDisplay extends StatefulWidget {

  @override
  _TotalDisplayState createState() => _TotalDisplayState();
}

class _TotalDisplayState extends State<TotalDisplay> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model)
        {
          return
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total Amount:  ${model.count}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                  ),
                ),

              ],
            );
        });
  }
}
