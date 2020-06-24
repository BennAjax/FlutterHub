import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FriendlyChatApp());
}

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

class FriendlyChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FriendlyChat',
        theme: defaultTargetPlatform == TargetPlatform.iOS // NEW
            ? kIOSTheme                                      // NEW
            : kDefaultTheme,
        home: ChatScreen()
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final FocusNode _focusNode = FocusNode();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friendly Chat'),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Container(
        child: Column(
          // MODIFIED
          children: [
            // NEW
            Flexible(
              // NEW
              child: ListView.builder(
                // NEW
                padding: EdgeInsets.all(8.0), // NEW
                reverse: true, // NEW
                itemBuilder: (_, int index) => _messages[index], // NEW
                itemCount: _messages.length, // NEW
              ), // NEW
            ), // NEW
            Divider(height: 1.0), // NEW
            Container(
              // NEW
              decoration:
                  BoxDecoration(color: Theme.of(context).cardColor), // NEW
              child: _buildTextComposer(), //MODIFIED
            ), // NEW
          ], // NEW
        ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS // NEW
              ? BoxDecoration(          // NEW
            border: Border(       // NEW
              top: BorderSide(color: Colors.grey[200]), // NEW
            ),                    // NEW
          )                       // NEW
              : null),
    );// NEW
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _textController,
                  onChanged: (String text) {
                    setState(() {
                      _isComposing = text.length > 0;
                    });
                  },
                  onSubmitted: _isComposing ? _handleSubmitted : null, //
                  decoration:
                      InputDecoration.collapsed(hintText: 'Send a message'),
                  focusNode: _focusNode,
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS ? // MODIFIED
                  CupertinoButton(                                      // NEW
                    child: Text('Send'),                                // NEW
                    onPressed: _isComposing                             // NEW
                        ? () =>  _handleSubmitted(_textController.text) // NEW
                        : null,) :   IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _isComposing // MODIFIED
                        ? () =>
                            _handleSubmitted(_textController.text) // MODIFIED
                        : null,
                  ))
            ],
          )),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {                             // NEW
      _isComposing = false;                   // NEW
    });
    ChatMessage message = ChatMessage(
      //NEW
      text: text,
      animationController: AnimationController(
        // NEW
        duration: const Duration(milliseconds: 700), // NEW
        vsync: this, // NEW
      ), //NEW
    ); //NEW
    setState(() {
      //NEW
      _messages.insert(0, message); //NEW
    });
    _focusNode.requestFocus(); // Add focus to textfield after submission
    message.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  ChatMessage({this.text, this.animationController}); // NEW

  @override
  Widget build(BuildContext context) {
    String _name = 'Benn';

    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(child: Text(_name[0])),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_name, style: Theme.of(context).textTheme.headline4),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
