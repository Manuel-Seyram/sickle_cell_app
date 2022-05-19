import 'package:flutter/material.dart';
import 'package:sickle_cell_app/extras/animations.dart';

class ToDoEmptyState extends StatelessWidget {
  const ToDoEmptyState({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      .5,
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/to-do.png',
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 50.0),
          const Text(
            'No ToDos Added yet',
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 16),
          )
        ],
      ),
    );
  }
}