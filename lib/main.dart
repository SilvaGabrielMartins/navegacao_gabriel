import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int contadorButao = 0;

  void _contar({int quantidade = 1}) {
    setState(() {
      contadorButao += quantidade;
      print(contadorButao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador cliques"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$contadorButao',
              style: TextStyle(
                fontSize: 35.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.blue,
                    maxRadius: 30.0,
                    child: Column(
                      children: [
                        Text('Max'),
                        Text('Valor'),
                      ],
                    )),
                CircleAvatar(
                    backgroundColor: Colors.blue,
                    maxRadius: 30.0,
                    child: Column(
                      children: [
                        Text('Min'),
                        Text('Valor'),
                      ],
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Adicionar'),
                  onPressed: _contar,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.cyan[200])),
                ),
                ElevatedButton(
                  child: Text('Subtrair'),
                  onPressed: () {
                    setState(() {
                      if (contadorButao == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Impossível subtrair contagem de zero')));
                      } else {
                        contadorButao--;
                      }
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.cyan[200])),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Adicionar (+2)'),
                  onPressed: () {
                    _contar(quantidade: 2);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.cyan[200])),
                ),
                ElevatedButton(
                  child: Text('Subtrair (-2)'),
                  onPressed: () {
                    setState(() {
                      if (contadorButao == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Impossível subtrair contagem de zero')));
                      } else {
                        contadorButao -= 2;
                      }
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.cyan[200])),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
