import 'package:flutter/material.dart';
import 'package:sickle_cell_app/extras/animations.dart';
import 'package:sickle_cell_app/models/to_do.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';
import 'package:sickle_cell_app/widgets/add_todo.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
     final deviceHeight = MediaQuery.of(context).size.height;
    ToDoModel model;
    return ScopedModel<ToDoModel>(
      model: model = ToDoModel(),
      child:  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            "To-Do",
            style: TextStyle(color: Colors.black, fontSize: 22.0),
          )),
        body: Center(
          child: SizedBox(
            height: 200.0,
            width: 300.0,
            child: Card(
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              ),
             elevation: 5.0,
             shadowColor: Colors.red,
             child: Column(
               children:  [
                 const SizedBox(height: 60.0,),
                 const Text('Welcome to To-Do. Plan your day here', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
                 const SizedBox(height: 10.0,),
                 const Text('Tap To-Do to begin', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),),
                 const SizedBox(height: 20.0,),
                 MaterialButton(
                   elevation: 5.0,
                   shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                 ),
                 minWidth: 5.0,
                 color: Colors.red.shade100,
                 visualDensity: VisualDensity.comfortable,
                 child: const Text('To-Do', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400) ,),
                   onPressed: (){
                     buildBottomSheet(deviceHeight, model);
                   }
                 )
               ],
             ),
            ),
          ),
        ),
      ),
    );
  }
   void buildBottomSheet(double height, ToDoModel model) async {
    var todoId = await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FadeAnimation(
            .6,
            AddTodo(height, model.getDatabase(), model.notificationManager),
          );
        });

    if (todoId != null) {
      Fluttertoast.showToast(
          msg: "The Task was added!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.shade100,
          textColor: Colors.white,
          fontSize: 20.0);

      setState(() {});
    }
  }
}
