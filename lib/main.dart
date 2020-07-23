import 'package:flutter/material.dart';
import 'package:workspace/screens/loginScreen.dart';

void main() => runApp(FlutterHubApp());

class FlutterHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterHub',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
