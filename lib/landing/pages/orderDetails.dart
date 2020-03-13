import 'package:flutter/material.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/orderClass.dart';
import 'dart:convert';
import 'dart:async';
import 'test.dart';
import 'package:http/http.dart' as http;
import 'cancelOrder.dart';
class OrderDetails extends StatefulWidget {
  final tableId;
  final roomId;
  final String title = "DropDown Demo";
  OrderDetails({this.tableId,this.roomId}) : super();

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}
class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'One'),
      Company(2, 'Two'),
      Company(3, 'three'),
      Company(4, 'four'),
      Company(5, 'five'),
    ];
  }
}
class _OrderDetailsState extends State<OrderDetails> {

  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  @override
  void initState() {
    setState(() {
      existUser();
    });
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }
  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
      existUser();
    });
  }

  @override
  Future existUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('tableId',widget.tableId);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 2.1,
        child: ResponsiveContainer(
          heightPercent: 50,
            widthPercent: 50,
            child: Column(
              children: <Widget>[
                Container(
                  color: Palatte.color1,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15,10,15,10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Order Details',style: TextStyle(color: Colors.white,
                          fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 0.2
                          ),),
                          InkWell(child: Icon(Icons.close,color: Colors.black87,),onTap: (){
                            Navigator.of(context).pop(true);},)
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Details of Pax 1',style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black87,letterSpacing: 0.1
                    ),),)
                ),

          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: DropdownButton(
                      value: _selectedCompany,
                      items: _dropdownMenuItems,
                      onChanged: onChangeDropdownItem,
                    ),
                  ),


                ],
              ),
            ),
          ),





                Padding(
                  padding: const EdgeInsets.fromLTRB(15,10,15,10),
                    child:Row(
                      children: <Widget>[
                        Expanded(flex:1,child:  Text('S.N.',style: Theme.of(context).textTheme.title),),
                        Expanded(flex:4,child:  Align(child: Text('Item Name',style: Theme.of(context).textTheme.title),
                          alignment: Alignment.centerLeft,),),
                        Expanded(flex:2,child:  Align(child: Container(child: Text('Quantity',style: Theme.of(context).textTheme.title)),
                          alignment: Alignment.center,),),
                        Expanded(flex:2,child:  Align(child: Text('Rate',style: Theme.of(context).textTheme.title),
                          alignment: Alignment.center,),),
                        Expanded(flex:2,child:  Align(child: Text('Amount',style: Theme.of(context).textTheme.title),
                          alignment: Alignment.center,),),
                      ],
                    ),

                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15),
                  child: Container(
                    height: 150,
//                    color: Colors.black12,
                    child: FutureBuilder<List<OrderCls>>(
                      future: fetchOrderMenu(http.Client()),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) ;
                        return snapshot.hasData ?
                        ListView.builder(
                          itemCount: snapshot.data == null ?0 : snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(flex:1,child:  Text('${index+1}',style: TextStyle(fontSize: 14),)),
                                      Expanded(flex:4,child:  Text(snapshot.data[index].name,style: TextStyle(fontSize: 14),)),
                                      Expanded(flex:2,child:  Align(alignment: Alignment.center,child: Text(snapshot.data[index].quantity.toString(),style: TextStyle(fontSize: 14),))),
                                      Expanded(flex:2,child:  Align(alignment: Alignment.center,child: Text(snapshot.data[index].rate.toString(),style: TextStyle(fontSize: 14),))),
                                      Expanded(flex:2,child:  Align(alignment: Alignment.center,child: Text(snapshot.data[index].amount.toString(),style: TextStyle(fontSize: 14),))),

                                    ],
                                  ),
                                ),

                              ],
                            );

                          },
                        ):Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: <Widget>[
                      Expanded(flex:1,child:  Text('-',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),)),
                      Expanded(flex:4,child:  Text('Total',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),)),
                      Expanded(flex:2,child:  Align(alignment: Alignment.center,child: Text(''))),
                      Expanded(flex:2,child:  Align(alignment: Alignment.center,child: Text('',style: TextStyle(fontSize: 14),))),
                      Expanded(flex:2,child:  Align(alignment: Alignment.center,child: Text('545',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),))),

                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    OutlineButton(
                      onPressed: () {},
                      child: Padding(padding: EdgeInsets.all(6),
                        // TODO Menu Send Order Button
                        child: InkWell(child: Text('Order Now', style: TextStyle(fontSize: 16,color: Palatte.color1),),

                        ),),
                      borderSide: BorderSide(color: Palatte.color1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: OutlineButton(
                        onPressed: () {},
                        child: Padding(padding: EdgeInsets.all(6),
                          // TODO Menu Send Order Button
                          child: InkWell(child: Text('Cancel Order', style: TextStyle(fontSize: 16,color: Palatte.errorColor),),
                            onTap: (){
                              Navigator.of(context).pop(true);
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return CancelOrder();
                                  }
                              );
                            },
                          ),),
                        borderSide: BorderSide(color: Palatte.errorColor),
                      ),
                    ),
                  ],
                )
              ],
            )
        ),
      )
    );
  }
}


