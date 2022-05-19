import 'quotes.dart';

class Contents {
  List<Quotes>? quotes;

  Contents({this.quotes});

  Contents.fromJson(Map<String, dynamic> json) {
    if (json['quotes']!= null) {
      quotes = <Quotes>[];
      json['quotes'].forEach((v) {
        quotes!.add(Quotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (quotes != null) {
      data['quotes'] = quotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}