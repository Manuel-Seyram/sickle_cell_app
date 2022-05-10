import 'package:flutter/material.dart';
import 'package:sickle_cell_app/service.dart';
import 'package:sickle_cell_app/models/quotes.dart';

class PostsPage extends StatelessWidget {
 final List<Quotes> quote = Httpservice.quoteOfTheDay;

  PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("quotes"),
      ),
      body: FutureBuilder(
        //future: httpService.getQuotes(),
        builder: (BuildContext context, AsyncSnapshot<List<Quotes>> snapshot) {
          if (snapshot.hasData) {
            //Future.delayed(const Duration(seconds: 5));
           // Quote? quotes = snapshot.data;
            return Text('" ${quote[0].quote} "');
            
          } else {
            return Scaffold(
              body: Column(children: const [
                SizedBox(height: 400.0),
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('loading')
              ]),
            );
          }
        },
      ),
    );
  }
}
