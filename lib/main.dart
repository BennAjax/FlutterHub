import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  void _playSound(int num) {
    AudioCache player = new AudioCache();
    player.play('sounds/note$num.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () => _playSound(1),
                color: Colors.red,
                child: null,
                padding: EdgeInsets.all(0.0),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () => _playSound(2),
                color: Colors.orange,
                child: null,
                padding: EdgeInsets.all(0.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () => _playSound(3),
                color: Colors.yellow,
                child: null,
                padding: EdgeInsets.all(0.0),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () => _playSound(4),
                color: Colors.green,
                child: null,
                padding: EdgeInsets.all(0.0),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () => _playSound(5),
                color: Colors.teal,
                child: null,
                padding: EdgeInsets.all(0.0),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () => _playSound(6),
                color: Colors.blue,
                child: null,
                padding: EdgeInsets.all(0.0),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () => _playSound(7),
                color: Colors.purple,
                child: null,
                padding: EdgeInsets.all(0.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}

