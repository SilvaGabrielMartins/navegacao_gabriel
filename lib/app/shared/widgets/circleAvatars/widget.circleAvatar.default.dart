import 'package:flutter/material.dart';

class WidgetCircleAvatarDefault extends StatelessWidget {
  final String valor;
  final String texto;
  final Color cor;
  const WidgetCircleAvatarDefault(
      {@required this.valor, @required this.texto, this.cor = Colors.blue, key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: cor,
        maxRadius: 30.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(texto),
            Text(valor),
          ],
        ));
  }
}
