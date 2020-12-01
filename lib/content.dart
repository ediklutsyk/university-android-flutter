abstract class Content {
  int getType();
}

class Item implements Content {
  String title;

  String message;

  String date;

  Item(this.title, this.message, this.date);

  @override
  int getType() {
    return 1;
  }
}

class Ad implements Content {
  String title;

  String link;

  Ad(this.title, this.link);

  @override
  int getType() {
    return 2;
  }
}
