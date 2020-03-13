import 'package:flutter/material.dart';
import 'package:hotelsimplify/bill/services/bill.dart';
import 'package:responsive_container/responsive_container.dart';
import 'services/bill.dart';
import 'package:http/http.dart' as http;
import 'leftSection.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CostSection extends StatefulWidget {
  @override
  _CostSectionState createState() => _CostSectionState();
}

class _CostSectionState extends State<CostSection> {
  String subTot='';
  void initState(){
    setState(() {
      getSum();
    });
    super.initState();
  }
  Future getSum() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      subTot = prefs.getDouble('subTot').toString();
    });
    print(subTot.runtimeType);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.yellow[700],
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total Amount:   2212.54',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: null,
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pop(true);
              },
            ),
          ),
          Row(
            children: <Widget>[
              ResponsiveContainer(
                heightPercent: 92.5,
                widthPercent: 50,
                child: LeftSection()
              ),
              ResponsiveContainer(
                heightPercent: 92.5,
                widthPercent: 50,
                child: Container(
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: <Widget>[
                       Expanded(
                         flex: 1,
                         child: Container(
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: <Widget>[
                               Expanded(flex:5,child: Text('Sales',
                                   style:
                                   TextStyle(fontWeight: FontWeight.bold)),),
                               Expanded(flex:2,child: Text('Amount',
                                   style:
                                   TextStyle(fontWeight: FontWeight.bold)),),
                               Expanded(flex:3,child: Row(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 children: <Widget>[
                                   Text('Cost',
                                       style:
                                       TextStyle(fontWeight: FontWeight.bold))
                                 ],
                               )),



                             ],
                           ),
                         )
                       ),
                       Expanded(
                         flex: 1,
                         child: Padding(
                           padding: const EdgeInsets.symmetric(vertical:3.0),
                           child: Container(
                             decoration: BoxDecoration(
                                 color: Colors.grey[400],
                                 border: Border(
                                   top: BorderSide(color: Colors.black),
                                   bottom: BorderSide(color: Colors.black),
                                 )),
                             height: 30.0,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                                 Text('KOT',
                                     style:
                                     TextStyle(fontWeight: FontWeight.bold)),
                                 Text('      ',
                                     style:
                                     TextStyle(fontWeight: FontWeight.bold)),
                                 Text('$subTot',
                                     style:
                                     TextStyle(fontWeight: FontWeight.bold))
                               ],
                              ),
                            ),
                         ),
                       ),
                       Expanded(child:  FutureBuilder<List<billData>>(
                           future: fetchBillData(http.Client()),
                           builder: (context, snapshot) {
                             if (snapshot.hasError);
                             return snapshot.hasData ?
                             ListView.builder(
                                 itemCount: snapshot.data == null ? 0 : snapshot.data
                                     .length,
                                 itemBuilder: (context, index) {
                                   return Padding(
                                     padding: const EdgeInsets.symmetric(vertical: 6.0),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: <Widget>[
                                         Expanded(child: Text(snapshot.data[index].Name,style: TextStyle(),),flex: 5,),
                                         Expanded(child: Text('${snapshot.data[index].Rate}',style: TextStyle(),),flex: 2,),
                                         Expanded(child: Row(
                                           mainAxisAlignment: MainAxisAlignment.end,
                                           children: <Widget>[
                                             Text('${snapshot.data[index].Amount}',style: TextStyle(),)
                                           ],),flex: 3,),

                                       ],
                                     ),
                                   );
                                 }) : Center(child:CircularProgressIndicator()
                             );
                           }),flex: 16,),
                      ],
                    ),
                  ),
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}


TableRow menuPrice(String item, int quantity, double price) =>
    TableRow(children: [
      TableCell(
        child: Container(
          height: 30.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(item,style: TextStyle(color: Colors.red),),
              Text(quantity.toString()),
              Text(price.toString())
            ],
          ),
        ),
      )
    ]);
