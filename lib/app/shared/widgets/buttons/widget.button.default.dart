import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetButtonDefault extends StatelessWidget {
  final Function funcao;
  final String texto;
  final int quantidade;
  final Color corTexto;
  final Color corBotao;
  const WidgetButtonDefault(
      {@required this.funcao,
      @required this.texto,
      this.quantidade = 1,
      this.corTexto = Colors.black,
      this.corBotao = Colors.blue,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(texto, style: TextStyle(color: corTexto)),
      onPressed: (() {
        funcao(quantidade: quantidade);
      }),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(corBotao)),
    );
  }
}
