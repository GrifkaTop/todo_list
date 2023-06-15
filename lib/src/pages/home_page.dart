import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../data/database.dart';
import '../feature/dialog_box.dart';
import '../feature/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // box
  final _myBox = Hive.box('mybox');

  // text controller
  final _controller = TextEditingController();

  //список задач
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    //если первый раз открываем то
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //смотрим изменения выполнения задачи (тупо галочка)
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

//Сохранение новой задачи
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

//Создание новой задчи
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
          key: null,
        );
      },
    );
  }

  void hideCompletedTasks() {}

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  /*Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: hideCompletedTasks,
                          icon: Icon(Icons.visibility_off, color: Colors.black))
                    ]),*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //кнопка добавление задачё
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
          body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                title:
                    Text('Мои Задачи', style: TextStyle(color: Colors.black)),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                      alignment: Alignment.center,
                      child: ToDoTile(
                        // задачи
                        taskName: db.toDoList[index][0],
                        taskCompleted: db.toDoList[index][1],
                        onChanged: (value) => checkBoxChanged(value, index),
                        deleteFunction: (context) => deleteTask(index),
                      ));
                },
                childCount: db.toDoList.length,
              ),
            ),
          ],
        ));
  }
//версия без аппбара
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar  потом тут сделать
        backgroundColor: Colors.grey,
        //кнопка добавление задачё
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        //Задачи
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
   */
}
