import 'dart:ui';

import 'package:flutter/material.dart';

double venCalcularIMC(double peso, double altura) => peso / (altura * altura);

String retornaClassificacaoIMC(double resultado) {
  var classificacao = "";
  switch (resultado) {
    case < 18.5:
      classificacao = "Magreza";
      break;
    case < 24.9:
      classificacao = "Normal";
      break;
    case < 29.5:
      classificacao = "Sobrepeso";
      break;
    case < 39.9:
      classificacao = "Obesidade";
      break;
    case > 40.0:
      classificacao = "Obesidade Grave";
      break;
    default:
      classificacao = "Não foi possivel verificar a classificação do seu IMC";
  }
  return classificacao;
}

Color retornaCorClassificacaoIMC(String cClassificacao) {
  Color cor;
  switch (cClassificacao) {
    case "Magreza":
      cor = Colors.blue;
      break;
    case "Normal":
      cor = Colors.green;
      break;
    case "Sobrepeso":
      cor = Colors.orange;
      break;
    case "Obesidade":
      cor = const Color.fromARGB(255, 241, 91, 80);
      break;
    case "Obesidade Grave":
      cor = const Color.fromARGB(255, 167, 12, 1);
      break;
    default:
      cor = Colors.black; // Cor padrão para a mensagem de erro
  }
  return cor;
}
