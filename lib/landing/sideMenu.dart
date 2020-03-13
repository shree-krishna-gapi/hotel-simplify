import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'services/parentMenu.dart';
import 'services/custom_expansion_tile.dart' as custom;
import 'childMenu.dart';
class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}
class _SideMenuState extends State<SideMenu> {
  Widget build(BuildContext context) {
    return FutureBuilder<List<parentMenu>>(
      future: fetchParentMenu(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) ;
        return snapshot.hasData ?
        ListView.builder(
          itemCount: snapshot.data == null ?0 : snapshot.data.length,
          itemBuilder: (context, index) {
            return custom.ExpansionTile(title: Text(snapshot.data[index].RoomType), // 1st parent menu
              children: <Widget>[
                ChildMenu(
                    parentId: snapshot.data[index].ID,
                    roomType: snapshot.data[index].RoomType,
                    description: snapshot.data[index].Description
                )
              ],
            );

          },
        ):Center(child: CircularProgressIndicator());
      },
    );
  }
}


