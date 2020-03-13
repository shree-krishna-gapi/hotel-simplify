//import 'package:scoped_model/scoped_model.dart';
//import 'package:queries/collections.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:async';
//import 'dart:convert';
//class MainModell extends Model {
//  String _name = "";
//  double _count = 0;
//
//  String get name {
//    return _name;
//  }
//
//  double get count {
//    return _count;
//  }
//
//  void updateName(String name) {
//    _name = name;
//  }
//
//  double tot=0.0;
//
//
//  var listId = new List();
//  var listAmount = new List();
//
//
//  void qtyCounter() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    var menuItemsId = prefs.getStringList('menuItemsId');
//    double ans = 0.0;
//    double tot = 0.0;
//    int i;
//    for(i=0;i<menuItemsId.length;i++) {
//      print('${prefs.getInt('item$i')} * ${prefs.getDouble('listAmount$i')}');
//
//      ans = prefs.getInt('item$i')*prefs.getDouble('listAmount$i');
//
//      tot += ans;
//    }
//    _count = tot;
//    notifyListeners();
//  }
//
//}
//
//
//
//
//
////listId.add(id);
////var result = new Collection(listId).distinct();
////var gg = result.toList();
////print(gg);
////_count = tot;