import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: "List View Collapsable",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageScreenState createState() => new _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePage> {
  double sum = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(leading: Text(sum.toString())),
      body: new ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, i) {
          return new ExpansionTile(
            title: new Text(
              categories[i].title,
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            children: <Widget>[
              new Column(
                children: _buildExpandableContent(categories[i]),
              ),
            ],
          );
        },
      ),
    );
  }

  _buildExpandableContent(Category categories) {
    List<Widget> columnContent = [];

    for (Item content in categories.contents)
      columnContent.add(
        new ListTile(
            title: Row(
              children: [
                new Text(
                  content.name,
                  style: new TextStyle(fontSize: 15.0, color: Colors.black87),
                ),
                Spacer(),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      if (content.quantity > 0) {
                        content.quantity--;
                        sum -= content.value;
                      }
                      ;
                    });
                  },
                  child: Icon(Icons.remove),
                ),
                Text(content.quantity.toString()),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      content.quantity++;
                      sum += content.value;
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
            onTap: () {}),
      );

    return columnContent;
  }
}

class Category {
  final String title;
  List<Item> contents = [];
  Category(this.title, this.contents);
}

class Item {
  String name;
  double value;
  int quantity;
  Item(this.name, this.value, this.quantity);
}

final titles = [
  'Furniture',
  'Carpets',
];

List<Category> categories = [
  new Category('Furniture',
      [new Item('Single Bed', 10.0, 0), new Item('King Bed', 10.0, 0)]),
  new Category('Carpets & Flooring', [
    new Item("Carpet tiles 12'x12'", 13.0, 0),
    new Item("Small rug 3'x6'", 55.0, 0),
  ]),
];
