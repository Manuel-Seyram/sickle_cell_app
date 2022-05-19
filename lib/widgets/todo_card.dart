import 'package:flutter/material.dart';
import 'package:sickle_cell_app/extras/database/database.dart';

class ToDoCard extends StatelessWidget {
  final ToDoTableData todo;
  final Color color;

  const ToDoCard(this.todo, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: 180,
      height: 180,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            width: 50,
            height: 50,
            child: Hero(
              tag: todo.name,
              child: Image.asset(
                todo.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  todo.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: width * .06),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                todo.extra.toLowerCase(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: width * .034,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}