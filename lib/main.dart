import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const KittenApp());

class KittenApp extends StatelessWidget {
  const KittenApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'kitten App',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            buttonColor: Colors.purple,
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary)),
        home: HomePage());
  }
}

// Because IOS Simulators and Android emulators use different addresses to represent the machine they are running on
final String server = defaultTargetPlatform == TargetPlatform.android
    ? "192.168.43.253"
    : "localhost";

class Kitten {
  const Kitten({this.name, this.description, this.age, this.imageUrl});

  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final List<Kitten> _kittens = <Kitten>[
  Kitten(
    name: 'Mittens',
    description:
        'This pinnacle of cats. When Mittens sits in your lap, you feel like royalty.',
    age: 11,
    imageUrl: 'kitten0.jpg',
  ),
  Kitten(
    name: 'Fluffy',
    description: 'World\'s cutest kitten, Seriously, we did the research',
    age: 3,
    imageUrl: 'kitten1.jpg',
  ),
  Kitten(
    name: 'Scooter',
    description: 'Chases string faster than 9/10 competing kittens',
    age: 2,
    imageUrl: 'kitten2.jpg',
  ),
  Kitten(
    name: 'Steve',
    description: 'Steve is cool and just kind of hangs out',
    age: 4,
    imageUrl: 'kitten3.jpg',
  ),
  Kitten(
    name: 'Mikky',
    description: 'Cool like a sheep but furious as a tiger',
    age: 6,
    imageUrl: 'kitten4.png',
  )
];

Widget _dialogBuilder(BuildContext context, Kitten kitten) {
  final ThemeData themeData = Theme.of(context);
  return SimpleDialog(
    contentPadding: EdgeInsets.zero,
    children: <Widget>[
      Image.asset('assets/images/${kitten.imageUrl}', fit: BoxFit.fill),
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              kitten.name,
              style: themeData.textTheme.headline4,
            ),
            Text('${kitten.age} months old',
                style: themeData.textTheme.subtitle1
                    .copyWith(fontStyle: FontStyle.italic)),
            SizedBox(height: 16.0),
            Text(kitten.description, style: themeData.textTheme.bodyText1),
            SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: Wrap(
                children: <Widget>[
                  FlatButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    child: Text('I\'M ALLERGIC'),
                  ),
                  RaisedButton(
                    onPressed: () => {},
                    child: Text('ADOPT'),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget _listItemBuilder(BuildContext context, int index) {
  return GestureDetector(
    onTap: () => showDialog(
        context: context,
        builder: (context) => _dialogBuilder(context, _kittens[index])),
    child: Container(
      padding: const EdgeInsets.only(left: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(_kittens[index].name,
          style: Theme.of(context).textTheme.headline),
    ),
  );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kitten Catalog'),
      ),
      body: ListView.builder(
        itemBuilder: _listItemBuilder,
        itemCount: _kittens.length,
        itemExtent: 60.0,
      ),
    );
  }
}
