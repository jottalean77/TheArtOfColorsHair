import 'package:flutter/material.dart';
import 'coloracao_helper.dart';

class ResultScreen extends StatelessWidget {
  final int corBaseCliente;
  final int porcentagemBranco;
  final int alturaTomDesejada;

  ResultScreen({
    required this.corBaseCliente,
    required this.porcentagemBranco,
    required this.alturaTomDesejada,
  });

  @override
  Widget build(BuildContext context) {
    // Instanciando a classe ColoracaoHelper
    ColoracaoHelper coloracaoHelper = ColoracaoHelper();

    // Chamando o método determinarFormulaCor
    String resultado = coloracaoHelper.determinarFormulaCor(
      corBaseCliente,
      porcentagemBranco,
      alturaTomDesejada,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado da Coloração"),
      ),
      body: Center(
        child: Text(
          resultado,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
