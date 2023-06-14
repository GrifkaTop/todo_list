import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {required super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
          height: 120,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Имя задачи"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //кнопка сохранить
                    MyButton(text: "Сохранить", onPressed: onSave),
                    const SizedBox(
                      width: 4,
                    ),
                    //копнка отмена
                    MyButton(text: "Отмена", onPressed: onCancel),
                  ],
                )
              ])),
    );
  }
}
