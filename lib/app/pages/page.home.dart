import 'package:flutter/material.dart';
import 'package:navegacao_gabriel/app/shared/widgets/circleAvatars/widget.circleAvatar.default.dart';

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
      print(contadorButao);
      if (contadorButao > valorMaximo) {
        valorMaximo = contadorButao;
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
                  ElevatedButton(
                    child: Text('Adicionar',
                        style: TextStyle(color: Colors.black)),
                    onPressed: _contar,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                  ),
                  ElevatedButton(
                    child:
                        Text('Subtrair', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        if (contadorButao == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Impossível subtrair contagem de zero')));
                        } else {
                          contadorButao--;
                          if (contadorButao < valorMinimo) {
                            valorMinimo = contadorButao;
                          }
                        }
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text('Adicionar (+2)',
                        style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      _contar(quantidade: 2);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                  ),
                  ElevatedButton(
                    child: Text('Subtrair (-2)',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      setState(() {
                        if (contadorButao == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Impossível subtrair contagem de zero')));
                        } else {
                          contadorButao -= 2;
                          if (contadorButao < valorMinimo) {
                            valorMinimo = contadorButao;
                          }
                        }
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black)),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh), onPressed: _reiniciar));
  }
}
