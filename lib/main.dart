import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workspace/components/TaxiLogo.dart';
import 'package:workspace/components/AppBackground.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(FlutterHubApp());

class FlutterHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        SplashScreen.id: (BuildContext context) => SplashScreen(),
        WelcomeScreen.id: (BuildContext context) => WelcomeScreen(),
        LoginScreen.id: (BuildContext context) => LoginScreen()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  static String id = "SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, WelcomeScreen.id),
      child: AppBackground(child: TaxiLogo()),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  static String id = "WelcomeScreen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
        child: Column(
      children: <Widget>[
        Flexible(
          flex: 3,
          child: Center(
            child: _welcome(),
          ),
        ),
        Container(
          color: Color(0xffe10e3f),
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, LoginScreen.id),
                child: Text('SIGN IN',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ),
              VerticalDivider(
                color: Colors.white,
                thickness: 1.0,
                indent: 10.0,
                endIndent: 10.0,
              ),
              Text('SIGN IN',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500))
            ],
          ),
        )
      ],
    ));
  }

  Widget _welcome() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          'Welcome to',
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 18.0),
        TaxiLogo(),
        SizedBox(height: 22.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
          child: Text(
            'Our mission is to get you from A to B as cost effectively as possible by linking you with reputable transport providers',
            style: TextStyle(
                color: Colors.white,
                fontSize: 13.5,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 24.0),
          child: Text(
            'Click on the "Signup Up" button - it\'s a 1 minute bit of admin and then you\'re ready to go!',
            style: TextStyle(
                color: Colors.white,
                fontSize: 13.5,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

class LoginScreen extends StatefulWidget {
  static String id = "LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 70.0),
            TaxiLogo(),
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.perm_identity, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white, width: 1.0, style: BorderStyle.solid)
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(12.0),
                    filled: true,
                    fillColor: Color(0xff575c68)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.lock_outline, color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.white, width: 1.0, style: BorderStyle.solid)
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(12.0),
                    filled: true,
                    fillColor: Color(0xff575c68)
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
              height: 46.0,
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                child: Text('SIGN IN', style: TextStyle(color: Colors.white),),
                color: Color(0xffe10e3f),
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Color(0xffe10e3f))),
                onPressed: () => Navigator.pushNamed(context, SplashScreen.id),
              ),
            ),
            Text('Forgot password?', style: TextStyle(color: Colors.white)),
            SizedBox(height: 40.0),
            RichText(
              text: TextSpan(
                text: 'Dont have an account?  ',
                style: TextStyle(color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                    text: 'SIGN UP',
                    style: TextStyle(
                      color: Color(0xffe10e3f),
                      fontSize: 17.0
                    )
                  )
                ]
              ),
            ),
            SizedBox(height: 30.0),
            Icon(Icons.arrow_drop_down, color: Color(0xffe10e3f), size: 50.0),
            Text('Or Sign Up or Login With', style: TextStyle(color: Colors.white, fontSize: 15.0)),
            SizedBox(height: 15.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FaIcon(FontAwesomeIcons.facebookSquare, color: Colors.white, size: 22.5),
                SizedBox(width: 45.0,),
                FaIcon(FontAwesomeIcons.googlePlusG, color: Colors.white, size: 25.0),
              ],
            )
          ],
        ),
      ),
    );
  }
}
