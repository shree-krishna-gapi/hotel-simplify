import 'package:rxdart/rxdart.dart';
import 'package:queries/collections.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoService {
  BehaviorSubject<List<String>> _todos = BehaviorSubject.seeded([]);
  Observable get stream$ => _todos.stream;
  List<String> get todos => _todos.value;


  BehaviorSubject<List<String>> _todos1 = BehaviorSubject.seeded([]);
  Observable get stream1$ => _todos1.stream;
  List<String> get todos1 => _todos1.value;


  addTodo(String data,String dataId) {

    final List<String> newTodo = todos;
    var result = new Collection(newTodo).distinct();
      newTodo.add(data);
      var filterData = result.toList();
    _todos.add(filterData); // with filter name



    final List<String> newTodo1 = todos1;
    var result1 = new Collection(newTodo1).distinct();
    newTodo1.add(dataId);
    var filterData1 = result1.toList();
    _todos1.add(filterData1); // with filter id
    _storeItems1(todos1);

  }





















  // store items id as a list
  _storeItems1(itemValue1) async {
    // all data data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('menuItemsId',itemValue1);
    prefs.setBool('selectItems', true);
  }
  // restore items name after remove item
  addTodo1(String removeItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var listItems = prefs.getStringList('menuItems');
    final List<String>items = listItems;
    items.remove(removeItem);
    _todos.add(items);
    prefs.setStringList('menuItems',listItems);
  }
  // restore items id after remove item
  addTodoId(int removeItem1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var removeItemId = prefs.getStringList('menuItemsId');
    removeItemId.removeAt(removeItem1);
    final List<String>items = removeItemId;
    items.remove(removeItemId);
    _todos1.add(items);
    prefs.setStringList('menuItemsId',removeItemId);
  }
}

