import 'package:flutter/material.dart';
import 'package:navegacao_gabriel/app/pages/page.home.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: PageHome(),
    );
  }
}
