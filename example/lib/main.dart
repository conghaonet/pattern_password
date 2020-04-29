import 'package:flutter/material.dart';
import 'package:flutter_gesture_password/flutter_gesture_password.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture password demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<MiniGesturePasswordState> miniGesturePassword =
  GlobalKey<MiniGesturePasswordState>();

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldState,
        appBar: AppBar(
          title: Text('Gesture password demo'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: MiniGesturePassword(key: miniGesturePassword),
            ),
            GesturePassword(
              successCallback: (s) {
                print("successCallback$s");
                scaffoldState.currentState?.showSnackBar(SnackBar(
                    content: Text('successCallback:$s')));
                miniGesturePassword.currentState?.setSelected('');
              },
              failCallback: () {
                print('failCallback');
                scaffoldState.currentState?.showSnackBar(
                    SnackBar(content: Text('failCallback')));
                miniGesturePassword.currentState?.setSelected('');
              },
              selectedCallback: (str) {
                miniGesturePassword.currentState?.setSelected(str);
              },
            )
          ],
        ),
      ),
    );
  }
}
