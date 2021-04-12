import 'package:flutter/material.dart';
import 'package:navegacao_gabriel/app/pages/page1.dart';
import 'package:navegacao_gabriel/app/pages/page3.dart';

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Informações sobre o App'),
            ElevatedButton(
                child: Text('Vai para a próxima página (3)'),
                onPressed: () {
                  Navigator.pushNamed(context, '/page3',
                      arguments: 'Veio da página 2');
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => Page3()));
                }),
            ElevatedButton(
                child: Text('Voltar para a página (1)'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
