import 'package:flutter/material.dart';
import 'package:productivity_app/models/Classes/Task.dart';
import 'package:productivity_app/models/Widgets/Intray_todo.dart';
import '../../models/global.dart';

class IntrayPage extends StatefulWidget {
  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  List<Task> tasks = [];

  void onreorder(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      Task x = tasks.removeAt(oldindex);
      tasks.insert(newindex, x);
    });
  }

  Widget buidListItem(BuildContext context, Task item) {
    return ListTile(
        key: Key(item.taskId),
        title: IntrayTodo(
          title: item.title,
        ));
  }

  Widget buildReorderableList(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
      ),
      child: ReorderableListView(
        padding: EdgeInsets.only(top: 255),
        children:
            tasks.map((Task item) => buidListItem(context, item)).toList(),
        onReorder: onreorder,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    tasks = getList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkGreyColor,
      child: buildReorderableList(context),
    );
  }

  List<Task> getList() {
    List<Task> tasks = [];
    for (int i = 0; i < 10; i++) {
      tasks.add(Task(
          title: "Todo " + i.toString(),
          completed: false,
          taskId: i.toString()));
    }
    return tasks;
  }
}
