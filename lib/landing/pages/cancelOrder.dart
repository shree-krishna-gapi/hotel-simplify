import 'package:flutter/material.dart';
import 'package:hotelsimplify/utils/utility.dart';
import 'package:responsive_container/responsive_container.dart';
class CancelOrder extends StatefulWidget {
  @override
  _CancelOrderState createState() => _CancelOrderState();
}

class _CancelOrderState extends State<CancelOrder> {
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
                          Text('Cancel Confirm',style: TextStyle(color: Colors.white,
                              fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 0.2
                          ),),
                          InkWell(child: Icon(Icons.close,color: Colors.black87,),onTap: (){
                            Navigator.of(context).pop(true);},)
                        ],
                      ),
                    ),
                  ),
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
                            value: 'df',
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                Container(

                )
              ],
            )
          )
        )
    );
  }
}
