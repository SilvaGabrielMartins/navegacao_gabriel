import 'package:flutter/material.dart';
import 'package:navegacao_gabriel/app/pages/page2.dart';
import 'package:navegacao_gabriel/app/pages/page.home.dart';
import 'package:navegacao_gabriel/app/shared/widgets/circleAvatars/widget.circleAvatar.default.dart';

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int valor = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('O maior valor obtido'),
            WidgetCircleAvatarDefault(
              texto: 'Max',
              valor: '$valor',
            ),
            ElevatedButton(
                child: Text('Vai para a próxima página (2)'),
                onPressed: () {
                  Navigator.pushNamed(context, '/page2',
                      arguments: "Veio da página 1");
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => Page2()));
                }),
            ElevatedButton(
                child: Text('Voltar para a página (Home)'),
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => PageHome()));
                }),
          ],
        ),
      ),
    );
  }
}
