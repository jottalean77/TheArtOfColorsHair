import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aartedecolorircabelos/main.dart';
import 'package:aartedecolorircabelos/login_screen.dart';
import 'package:aartedecolorircabelos/welcome_screen.dart';
import 'package:aartedecolorircabelos/result_screen.dart';

void main() {
  testWidgets('Testa a navegação entre as telas e o cálculo de coloração', (WidgetTester tester) async {
    // Constrói o aplicativo e exibe a tela de login.
    await tester.pumpWidget(MyApp());

    // Verifica se o campo de usuário e senha estão presentes.
    expect(find.byType(TextField), findsNWidgets(2)); // Usuário e senha

    // Simula o login preenchendo os campos de texto e pressionando o botão de login.
    await tester.enterText(find.byType(TextField).first, 'usuario');
    await tester.enterText(find.byType(TextField).last, 'senha');
    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle();

    // Verifica se estamos na tela de Boas-Vindas após o login.
    expect(find.text('Bem-vindo ao app JottaLean!'), findsOneWidget);

    // Preenche os inputs de coloração na Tela de Boas-Vindas.
    await tester.enterText(find.bySemanticsLabel('Altura de tom do cabelo'), '6');
    await tester.enterText(find.bySemanticsLabel('Porcentagem de cabelos brancos'), '30');
    await tester.enterText(find.bySemanticsLabel('Altura de tom desejada'), '6');
    await tester.tap(find.text('Calcular'));
    await tester.pumpAndSettle();

    // Verifica se a Tela de Resultado mostra a coloração sugerida.
    expect(find.text('A coloração sugerida é:'), findsOneWidget);
    expect(find.text('6.1'), findsOneWidget); // Exemplo de resultado esperado

    // Testa o botão de voltar para a Tela de Boas-Vindas.
    await tester.tap(find.text('Voltar'));
    await tester.pumpAndSettle();
    expect(find.text('Bem-vindo ao app JottaLean!'), findsOneWidget);
  });
}
