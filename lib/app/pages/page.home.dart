import 'package:flutter/material.dart';
import 'package:navegacao_gabriel/app/shared/widgets/buttons/widget.button.default.dart';
import 'package:navegacao_gabriel/app/shared/widgets/circleAvatars/widget.circleAvatar.default.dart';
import 'package:navegacao_gabriel/app/pages/page1.dart';

class PageHome extends StatefulWidget {
  PageHome({Key key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int contadorButao = 0, valorMaximo = 0, valorMinimo = 0;

  void _contar({int quantidade = 1}) {
    setState(() {
      contadorButao += quantidade;
      if (contadorButao > valorMaximo) {
        valorMaximo = contadorButao;
      }
    });
  }

  void _decrementar({int quantidade = 1}) {
    setState(() {
      if (contadorButao == 0) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Impossível subtrair contagem de zero')));
      } else {
        contadorButao -= quantidade;
        if (contadorButao < valorMinimo) {
          valorMinimo = contadorButao;
        }
      }
    });
  }

  void _reiniciar() {
    setState(() {
      contadorButao = 0;
      valorMaximo = 0;
      valorMinimo = 0;
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
                  WidgetCircleAvatarDefault(
                      texto: 'Max', valor: '$valorMaximo'),
                  WidgetCircleAvatarDefault(
                      texto: 'Min', valor: '$valorMinimo', cor: Colors.red),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WidgetButtonDefault(
                      texto: 'Adicionar',
                      corBotao: Colors.cyan[200],
                      funcao: _contar),
                  WidgetButtonDefault(
                    texto: 'Adicionar (+2)',
                    corBotao: Colors.cyan[200],
                    funcao: _contar,
                    quantidade: 2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WidgetButtonDefault(
                    texto: 'Subtrair',
                    funcao: _decrementar,
                  ),
                  WidgetButtonDefault(
                    texto: 'Subtrair (-2)',
                    funcao: _decrementar,
                    quantidade: 2,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      child: Text('Vai para a próxima página (1)'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/page1',
                            arguments: "Veio da página home");
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => Page1()));
                      }),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh), onPressed: _reiniciar));
  }
}
