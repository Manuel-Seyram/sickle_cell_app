import 'package:flutter/material.dart';
import 'package:sickle_cell_app/models/quotes.dart';
import 'package:sickle_cell_app/service.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("quotes"),
      ),
      body: FutureBuilder(
        future: Httpservice().getQuotes(),
        builder: (BuildContext context, AsyncSnapshot<List<Quotes>> snapshot) {
          if (snapshot.hasData) {
            //Future.delayed(const Duration(seconds: 5));
            // Quote? quotes = snapshot.data;
            final List<Quotes> quotes = snapshot.data!;
            return ListView.builder(
                itemCount: quotes.length,
                itemBuilder: (ctx, i) {
                  return Text(" ${quotes[0].quote} ");
                });
          } else {
            return Column(children: const [
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
            ]);
          }
        },
      ),
    );
  }
}