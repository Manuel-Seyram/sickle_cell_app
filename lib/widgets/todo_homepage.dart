import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sickle_cell_app/extras/icon_enum.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';
import 'package:sickle_cell_app/models/to_do.dart';
import 'package:sickle_cell_app/widgets/todo_delete_icon.dart';
import 'package:sickle_cell_app/widgets/todo_empty_state.dart';
import 'package:sickle_cell_app/widgets/todo_gridview.dart';

class ToDOPage extends StatefulWidget {
  const ToDOPage({Key? key}) : super(key: key);

  @override
  State<ToDOPage> createState() => _ToDOPageState();
}

class _ToDOPageState extends State<ToDOPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: ScopedModelDescendant<ToDoModel>(
      builder: (context, child, model) {
        return Stack(children: <Widget>[
          buildToDoView(model),
          (model.getCurrentIconState() == DeleteIconState.hide)
              ? Container()
              : DeleteIcon()
        ]);
      },
    ));
  }

  FutureBuilder buildToDoView(model) {
    return FutureBuilder(
      future: model.getToDoList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (kDebugMode) {
            print(snapshot.data);
          }
          if (snapshot.data.length == 0) {
            // No data
            return const Center(child: ToDoEmptyState());
          }
          return ToDoGridView(snapshot.data);
        }
        return (Container());
      },
    );
  }
}
