import 'package:flutter/material.dart';
//import 'CustomSearchDelegate.dart';
import 'package:hotelsimplify/utils/utility.dart';
class SearchContainer extends StatefulWidget {
  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(30,42,30,10),
            child: TextField(
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(
                    fontFamily: "Ubuntu",fontSize: 14,color: Palatte.am1,
                    fontWeight: FontWeight.w400
                ),
                labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Palatte.am1,
                  ),
                ),
                border: OutlineInputBorder(),
                suffixIcon: const Icon(
                  Icons.search,

                ),
              ),
              onTap: (){
//                showSearch(
//                  context: context,
//                );
              },
            ),


    );
  }
}
