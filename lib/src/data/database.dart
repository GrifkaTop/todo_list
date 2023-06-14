import 'package:hive/hive.dart';

class ToDoDataBase{
  List toDoList = [];
  final _myBox = Hive.box('mybox');

  // при первом запуске токо выполняется
  void createInitialData(){
    toDoList = [
      ["ПРимер", false],
      ["Пример 2", true],
    ];
  }

  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }
}