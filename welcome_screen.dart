import 'package:flutter/material.dart';
import 'result_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final TextEditingController hairColorLevelController = TextEditingController();
  final TextEditingController grayPercentageController = TextEditingController();
  final TextEditingController desiredToneLevelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JottaLean")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bem-vindo ao app JottaLean!", style: TextStyle(fontSize: 18)),
            TextField(
              controller: hairColorLevelController,
              decoration: InputDecoration(labelText: 'Altura de tom do cabelo'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: grayPercentageController,
              decoration: InputDecoration(labelText: 'Porcentagem de cabelos brancos'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: desiredToneLevelController,
              decoration: InputDecoration(labelText: 'Altura de tom desejada'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Converte os valores dos campos de texto para int
                int corBaseCliente = int.tryParse(hairColorLevelController.text) ?? 0;
                int porcentagemBranco = int.tryParse(grayPercentageController.text) ?? 0;
                int alturaTomDesejada = int.tryParse(desiredToneLevelController.text) ?? 0;

                // Navega para a Tela de Resultado
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      corBaseCliente: corBaseCliente,
                      porcentagemBranco: porcentagemBranco,
                      alturaTomDesejada: alturaTomDesejada,
                    ),
                  ),
                );
              },
              child: Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}
