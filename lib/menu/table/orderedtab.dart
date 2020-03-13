import 'package:flutter/material.dart';
import 'dart:async';
import 'package:responsive_container/responsive_container.dart';
import '../services/main.dart';
import '../services/todo_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'multiCounter.dart';
import 'extraDialog.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'package:hotelsimplify/utils/snackbar.dart';
class  OrderedTab extends StatefulWidget {
  OrderedTab({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _OrderedTabState();
  }
}
class _OrderedTabState extends State<OrderedTab> {

  void initState(){
    setState(() {
      checkItemNumber();
    });
    super.initState();
  }
  List<int> _current_Value = [1];
  int paxVal=1;
//  int paxZero;
  int paxNo;
  Future checkItemNumber() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    paxNo = prefs.getInt('createPax');

    setState(() {
//      paxVal = pax.toString();
    });
    prefs.setBool('checkItemNumber',false);
    prefs.setInt('removeItemCount',0);

    prefs.setDouble('lastTotal', 0.0);
  }
  bool isChecked = false;
  complementary(val) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isComplementary',val);
  }

//  var _current_Value = [1, 2, 3];

  var _current_Selected_Length = 1;
  void _onDropDownLengthSelected(newLengthSelected) {
    setState(() {
      this._current_Selected_Length = newLengthSelected;
    });
  }
  @override
  Widget build(BuildContext context) {
    final TodoService todoService = StateContainer.of(context).todoService;
//    final TodoService todoService1 = StateContainer.of(context).todoService1;
    return ResponsiveContainer(
      heightPercent: 100,
      widthPercent: 100,
      child: ListView(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 6,
                  child: Padding(padding: EdgeInsets.only(top: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround, //spaceBetween
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: isChecked,
                            activeColor: Palatte.color1,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value;
                                complementary(isChecked);
                              });

                            },

                          ),
                          Text('Is Complementary',style: Theme.of(context).textTheme.subhead), //

                          Text('|',style: Theme.of(context).textTheme.subhead),
                          Text('Bill No. ',style: Theme.of(context).textTheme.subhead),

                      DropdownButton<int>(
                        items: _current_Value.map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text('$value', style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black87,
                            ),),
                          );
                        }).toList(),
                        value: _current_Selected_Length,
                        onChanged: (int newLengthSelected) {
                          _onDropDownLengthSelected(newLengthSelected);
                        },
                      ),
                          SizedBox(width: 10,),
                          InkWell(
                            child: Icon(Icons.add_circle, color: Palatte.color1),
                            onTap: (){
                              setState(() {
                                if(paxVal < paxNo) {
                                  paxVal++;
//                                  for(paxNo=1;paxNo<=paxVal;paxNo++){
//                                    _current_Value.add(paxNo);
//                                  }
                                  _current_Value.add(paxVal);
                                }
                                else {
                                  emptySnack(BuildContext, context,'Max No of Pax is $paxNo!');
                                }
                              });

                            },
                          ),
                          SizedBox(width: 5,),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(left: BorderSide(width: 2.0,color: Colors.amber))
                              ),
                              child: Container(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  ' OrderList',style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                                ),
                              )
                          )
                        ],
                      )
                  )),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: <Widget>[
              Expanded(flex:1,child:  Text('S.N.',style: Theme.of(context).textTheme.title),),
              Expanded(flex:4,child:  Align(child: Text('Items',style: Theme.of(context).textTheme.title),
                alignment: Alignment.centerLeft,),),
              Expanded(flex:2,child:  Align(child: Container(child: Text('Quantity',style: Theme.of(context).textTheme.title)),
                alignment: Alignment.center,),),
              Expanded(flex:2,child:  Align(child: Text('Extras',style: Theme.of(context).textTheme.title),
                alignment: Alignment.center,),),
            ],
          ),
          Divider(color: Colors.black),
          Container(
            color: Color(0xFCFCFCFC),
            height: 400,
            child: StreamBuilder(
              stream: todoService.stream$,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return  Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(flex:1,child:  Text('${index+1}',style: TextStyle(fontSize: 14),)),
                              Expanded(flex:4,child:  Text(snapshot.data[index],style: TextStyle(fontSize: 14),)),
                              Expanded(flex:2,child: MultiCounter(title:'item$index',indexCount:index),
                              ),
                              Expanded(flex:2,child:  Align(child: ExtraDialog(note:'note$index'),
                                alignment: Alignment.centerLeft,),),
                            ],
                          ),
                          Divider(color: Colors.black26),
                        ],
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
  int removeItemCounter=1;
  removeItemQty(removeIndexIs) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('isEditRemove',1);
    final itemIdList = prefs.getStringList('menuItems');
    var kk;
    List<int>list= [];
    setState(() {
      for( int i = 0 ; i < itemIdList.length; i++){
        kk = prefs.getInt('item$i');
        list.add(kk);
      }
      list.removeAt(removeIndexIs);
      List<String>counterStrings= list.map((i)=>i.toString()).toList();
      prefs.setStringList('menuItemCounter',counterStrings);
    });
  }

}







