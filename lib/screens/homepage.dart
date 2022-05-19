import 'package:flutter/material.dart';
import 'package:sickle_cell_app/models/to_do.dart';
import 'package:sickle_cell_app/widgets/quotes.dart';
import 'package:sickle_cell_app/widgets/todo_homepage.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ToDoModel model;
    return ScopedModel<ToDoModel>(

        model: model = ToDoModel(),
        child: Scaffold(
          //extendBodyBehindAppBar: true,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: const Text(
                "Home",
                style: TextStyle(color: Colors.black, fontSize: 22.0),
              )),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: const [
                  SizedBox(
                    height: 20.0,
                  ),
                  Quotecard(),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 10.0,
                      child: Text(
                        '     To-Do',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      )),
                  SizedBox(
                    height: 50.0,
                  ),
                  ToDOPage(),
                ],
              ),
            ),
          ),
        ));
  }
}
