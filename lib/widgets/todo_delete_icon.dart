import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';
import 'package:sickle_cell_app/extras/animations.dart';
import 'package:sickle_cell_app/extras/database/database.dart';
import 'package:sickle_cell_app/models/to_do.dart';


// ignore: must_be_immutable
class DeleteIcon extends StatefulWidget {
  Color color = Colors.grey;

  DeleteIcon({Key? key}) : super(key: key);
  @override
  _DeleteIconState createState() => _DeleteIconState();
}

class _DeleteIconState extends State<DeleteIcon> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 20,
        left: 100,
        right: 100,
        child: ScopedModelDescendant<ToDoModel>(
            builder: (context, child, model) {
          return DragTarget<ToDoTableData>(
            builder: (context, rejectedData, candidtateData) {
              return FadeAnimation(
                .5,
                Container(
                  width: 250,
                  height: 220,
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      Icons.delete,
                      color: widget.color,
                      size: 60,
                    ),
                  ),
                ),
              );
            },
            onWillAccept: (todo) {
              if (kDebugMode) {
                print('onWillAccept was called');
              }
              setState(() {
                widget.color = Colors.red;
              });
              return true;
            },
            onLeave: (v) {
              setState(() {
                widget.color = Colors.grey;
              });
              if (kDebugMode) {
                print('onLeave');
              }
            },
            onAccept: (todo) {
              // remove it from the database
              model.getDatabase().deleteTodo(todo);
              //remove the medicine notifcation
              model.notificationManager.removeReminder(todo.id!);
              // for debugging
              if (kDebugMode) {
                print("Task deleted" + todo.toString());
              }
              // show delete snakbar
              // ignore: deprecated_member_use
              Scaffold.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    'Task deleted',
                    style: TextStyle(fontSize: 20),
                  ),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          );
        }));
  }
}