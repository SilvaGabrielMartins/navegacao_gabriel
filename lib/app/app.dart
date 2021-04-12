import 'package:flutter/material.dart';
import 'package:navegacao_gabriel/app/pages/page.home.dart';
import 'pages/page.home.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      //home: PageHome(),
      initialRoute: '/',
      routes: {
        '/': (context) => PageHome(),
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
        '/page3': (context) => Page3(),
      },
    );
  }
}
