import 'package:sickle_cell_app/extras/animations.dart';
import 'package:sickle_cell_app/extras/database/database.dart';
import 'package:sickle_cell_app/models/to_do.dart';
import 'package:flutter/material.dart';
import 'package:sickle_cell_app/widgets/todo_card.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class ToDoGridView extends StatelessWidget {
  final List<ToDoTableData> list;
   const ToDoGridView(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ToDoModel>(
        builder: (context, child, model) {
      return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        children: list.map((todo) {
          return InkWell(
            onTap: () {
              // details screen
            },
            child: buildLongPressDraggable(todo, model),
          );
        }).toList(),
      );
    });
  }

  LongPressDraggable<ToDoTableData> buildLongPressDraggable(
      todo, ToDoModel model) {
    return LongPressDraggable<ToDoTableData>(
      data: todo,
      onDragStarted: () {
        // show the delete icon
        model.toggleIconState();
      },
      onDragEnd: (v) {
        // hide the delete icon
        model.toggleIconState();
      },
      child: FadeAnimation(
        .05,
        Card(
          margin: const EdgeInsets.all(10),
          child: ToDoCard(todo, Colors.white),
        ),
      ),
      childWhenDragging: Container(
        color: const Color(0xff3EB16E).withOpacity(.3),
      ),
      feedback: Card(
        child: ToDoCard(todo, Colors.transparent),
      ),
    );
  }
}