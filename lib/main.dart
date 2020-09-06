import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(primarySwatch: Colors.deepOrange,
      buttonColor: Colors.deepOrange,
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary
      )),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

//1-create a Class of Kittens property
class Kitten {
  const Kitten({this.name, this.description, this.age, this.imageUrl});

  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

//2-this is globle String coz our app may be used on android and iphone.this helps us to resove any kind of problem
final String server =
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";
//3-lets create a list of Kitten object

final List _kitten = [
  Kitten(
    name: "Mittens",
    description:
        "The pinnacle of cats.when Mittens sits in your lap,you feel like royalty.",
    age: 5,
    imageUrl: "assets/6.jpeg",
  ),
  Kitten(
    name: "Fluffy",
    description: "worlds cutest kitten.Sreiously .we did ther research",
    age: 3,
    imageUrl: "assets/7.jpeg",
  ),
  Kitten(
    name: "Scooter",
    description: "Chases staring faster then 9/10 competing kitchens.",
    age: 3,
    imageUrl: "assets/8.jpg",
  ),
  Kitten(
    name: "Steve",
    description: "Steve is cool and just lkind of hang out",
    age: 4,
    imageUrl: "assets/9.jpeg",
  ),
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //7-to show AlertDialog we have to create _dialogBuilder and pass it on GestureDetector
  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    //8-in Simple Dialog we will see all About our items in list view
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: [
        Image.asset(
          kitten.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                kitten.name,
                style: localTheme.textTheme.headline4,
              ),
              Text(
                "${kitten.age} months old ",
                style: localTheme.textTheme.subtitle1.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                kitten.description,
                style: localTheme.textTheme.bodyText1,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(children: [
                  FlatButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("I\'m Allergic"),
                  ),
                  RaisedButton(
                    onPressed: (){},
                    child: Text("Adopt"),
                  )
                ],),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    //6-now Wrape of Container with GestureDetector to create onTap Properties
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _kitten[index])),
      child: Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.centerLeft,
          child: Text(
            _kitten[index].name,
            style: Theme.of(context).textTheme.headline4,
          )),
    );
//4-here we are returning kittens name in list order
  } //5-wrap it with container and give padding

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avilable kitthen"),
      ),
      //3-create ListView.builder and to defind _listItemBuilder we have to create widget in State <MyHomePage>
      body: ListView.builder(
          itemCount: _kitten.length,
          itemExtent: 60.0,
          itemBuilder: _listItemBuilder),
    );
  }
}
