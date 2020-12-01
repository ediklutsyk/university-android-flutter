import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/content.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: new RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text("Back"),
                )),
            Expanded(
                flex: 10,
                child: ListView(
                  children: buildListItems(),
                ))
          ],
        ),
      ),
    );
  }

  List<Widget> buildListItems() {
    List<Content> content = [
      Item("Title1", "Message1", "01.10"),
      Item("Title2", "Message2", "02.10"),
      Ad("Ad1", "http://annoying1.ad.com"),
      Item("Title3", "Message3", "03.10"),
      Item("Title4", "Message4", "04.10"),
      Ad("Ad2", "http://annoying2.ad.com"),
      Item("Title5", "Message5", "05.10"),
      Item("Title6", "Message6", "06.10"),
    ];

    return content.map((item) {
      switch (item.getType()) {
        case 1:
          return buildItem((item as Item).title, (item as Item).message,
              (item as Item).date);
        case 2:
          return buildAd((item as Ad).title, (item as Ad).link);
      }
    }).toList();
  }

  Widget buildItem(String title, String message, String date) {
    return Card(
        color: Colors.lightBlue,
        child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ]),
                Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            message,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          Text(
                            date,
                            style:
                                TextStyle(fontSize: 14, color: Colors.white54),
                          ),
                        ])),
              ],
            )));
  }

  Widget buildAd(String title, String link) {
    return Card(
        child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45),
              )),
          Text(link),
        ],
      ),
    ));
  }
}
