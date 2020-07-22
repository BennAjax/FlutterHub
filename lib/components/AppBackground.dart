import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({
    Key key, this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          decoration: BoxDecoration(
            color: const Color(0xff0b1022),
            image: DecorationImage(
              image: AssetImage('assets/images/taxi.jpeg'),
              fit: BoxFit.fitHeight,
              colorFilter: new ColorFilter.mode(
                  Color(0xff0b1022).withOpacity(0.1), BlendMode.dstATop),
            ),
          ),
          child: this.child
      ),
    );
  }
}