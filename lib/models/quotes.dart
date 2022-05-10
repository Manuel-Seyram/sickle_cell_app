class Quotes {
  String? quote;
  String? length;
  String? author;
  List<String>? tags;
  String? category;
  String? language;
  String? date;
  String? permalink;
  String? id;
  String? background;
  String? title;

  Quotes(
      {this.quote,
        this.length,
        this.author,
        this.tags,
        this.category,
        this.language,
        this.date,
        this.permalink,
        this.id,
        this.background,
        this.title});

  Quotes.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
    length = json['length'];
    author = json['author'];
    tags = json['tags'].cast<String>();
    category = json['category'];
    language = json['language'];
    date = json['date'];
    permalink = json['permalink'];
    id = json['id'];
    background = json['background'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quote'] = quote;
    data['length'] = length;
    data['author'] = author;
    data['tags'] = tags;
    data['category'] = category;
    data['language'] = language;
    data['date'] = date;
    data['permalink'] = permalink;
    data['id'] = id;
    data['background'] = background;
    data['title'] = title;
    return data;
  }
}