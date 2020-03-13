import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scoped_model/scoped_model.dart';
import '../services/scopedModel.dart';
import 'package:scoped_model/scoped_model.dart';
import '../services/scopedModel.dart';
class MultiCounter extends StatefulWidget {
  String title;
  int indexCount;
  MultiCounter({Key key,@required this.title, this.indexCount}): super(key:key);
  @override
  _MultiCounterState createState() =>new  _MultiCounterState();
}
class _MultiCounterState extends State<MultiCounter> {
  int _itemCount = 1;
  bool removeIcon = true;
  void initState(){
    setState(() {
      defaultItem();
    });
    super.initState();
  }
  var newlist = new List();
  Future defaultItem() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(widget.title,1);

//    var individualAmount = prefs.getString('individualAmount');
//    newlist.add(individualAmount);
//    print(newlist[0]);
  }
  getQty(g) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(widget.title,1);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model)
    {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            removeIcon ?
            InkWell(
              child: Icon(Icons.indeterminate_check_box, size: 24,), onTap: () {
//            child: Text('${newlist[0][widget.indexCount]}'), onTap:(){
              setState(() {
                if (_itemCount > 0) {
                  _itemCount--;
                  if (_itemCount == 0) {
                    setState(() {
                      removeIcon = false;
                    });
                  }
                  else {
                    getQty(_itemCount);
                  }
                }

              });
              itemIndex(widget.title);
              Future.delayed(const Duration(milliseconds: 100), () {
                model.qtyCounter();
              });
            },)

                : InkWell(child: Icon(Icons.indeterminate_check_box, size: 24,
              color: Color(0x00000000),)),
            Text('$_itemCount'),
            InkWell(child: Icon(Icons.add_comment), onTap: () {
              setState(() {
                _itemCount++;


                if (_itemCount > 0) {
                  removeIcon = true;
                  getQty(_itemCount);

                }

              });
              itemIndex(widget.title);
              Future.delayed(const Duration(milliseconds: 100), () {
                model.qtyCounter();
              });
            },),
          ],
        ),
      );
    });
  }
  itemIndex(itemIndexIs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(itemIndexIs,_itemCount);

  }
}