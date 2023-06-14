import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
        child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                SlidableAction(onPressed: deleteFunction,
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  ),
              ],
            ),
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    ),
                child: Row(children: [
                  Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.green,),
                  Text(taskName, style: TextStyle( decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                        color: taskCompleted ? Colors.grey : Colors.black),

                  ),
                ]),
               ))
    );
  }
}
