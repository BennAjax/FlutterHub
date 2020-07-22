import 'package:flutter/material.dart';

class TaxiLogo extends StatelessWidget {

  const TaxiLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.0)),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Text('TAXI',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3.0))),
          ),
          Container(
              color: Color(0xffd1d2d5),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                'APP',
                style: TextStyle(
                    color: Color(0xff4e505b),
                    fontSize: 28.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5),
              ))
        ],
      ),
    );
  }
}