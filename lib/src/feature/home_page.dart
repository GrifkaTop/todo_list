import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_list/src/feature/todo_title.dart';

import 'dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //список задач
  List toDoList = [
    ["Я ДЕЛАЮ ЧТО ХОЧУ", false],
    ["Я ДЕЛАЮ ЧТО ХОЧУ", false],
  ];

  //смотрим изменения выполнения задачи (тупо галочка)
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //Создание новой задчи
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox();
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar  потом тут сделать
        backgroundColor: Colors.grey,
        //кнопка добавление задач
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        //Задачи
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index)
            );
          },
        ));
  }
}
