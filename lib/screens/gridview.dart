import 'package:flutter/material.dart';
import 'package:sickle_cell_app/screens/homepage.dart';

class Gridview extends StatelessWidget {
  const Gridview ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 8,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(50, (index) {
            return SizedBox(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const MyHomePage();
                              }));
                },
              child: Card(
              child: Center(
                child: Text(
                '$index',
                style: Theme.of(context).textTheme.headline5,
              ),
            ))));
          }),
        ),
      ),
    );
  }
}