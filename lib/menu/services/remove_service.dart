//import 'package:rxdart/rxdart.dart';
//import 'package:queries/collections.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//class TodoService {
//  BehaviorSubject<List<String>> _todos = BehaviorSubject.seeded([]);
//
//  Observable get stream$ => _todos.stream;
//  List<String> get todos => _todos.value;
//
//  addTodo(String data) {
//    final List<String> newTodo = todos;
//    var result = new Collection(newTodo).distinct();
//    newTodo.add(data);
//    var filterData = result.toList();
//    _todos.add(filterData); // with filter
//    _incc(todos);
//
//  }
//  _incc(k) async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.setStringList('menuItems',k);
//
//    // todo menuItems
//  }
//
//}
//
//class TodoService1 {
//  BehaviorSubject<List<String>> _todos = BehaviorSubject.seeded([]);
//  Observable get stream$ => _todos.stream;
//  List<String> get todos => _todos.value;
//
//  addTodo1(String removeItem) async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    var listItems = prefs.getStringList('menuItems');
//    // todo menuItems
//    final List<String>items = listItems;
//    items.remove(removeItem);
//    _todos.add(items); // with filter
////    _incc(todos);
//  }
//}