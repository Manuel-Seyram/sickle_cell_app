import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sickle_cell_app/models/quotes.dart';
import 'package:sickle_cell_app/service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Quotecard extends StatelessWidget {
  const Quotecard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 500,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5.0,
          shadowColor: Colors.red,
          child: FutureBuilder(
            future: Httpservice().getQuotes(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Quotes>> snapshot) {
              if (snapshot.hasData) {
                //Future.delayed(const Duration(seconds: 5));
                // Quote? quotes = snapshot.data;
                final List<Quotes> quotes = snapshot.data!;
                if (kDebugMode) {
                  print("${quotes[0].quote} ");
                }
                //const SizedBox(height: 2,);
                return ListView.builder(
                    itemCount: quotes.length,
                    itemBuilder: (ctx, i) {
                      return ListTile(    
                        contentPadding: const EdgeInsets.all(20.0),      
                        title: Text( "${quotes[0].title} ",
                        style:
                            const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800, color: Colors.black),
                            textAlign: TextAlign.center,),    

                      subtitle: Text(
                        "${quotes[0].quote}",
                        style:
                            const TextStyle(fontSize: 20.0, color: Colors.black),
                            textAlign: TextAlign.center,
                      ),);
                      
                    });
              } else {
                return Column(children: const [
                  SizedBox(height: 60.0),
                  Center(
                    child: SpinKitThreeBounce(
                      color: Colors.black54,
                      size: 20.0,
                    ),
                  ),
                ]);
              }
            },
          )),
    );
  }
}
