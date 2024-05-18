import 'package:calculadora_imc/backend/realizar_calcular_imc.dart';
import 'package:flutter/material.dart';

class oTextField extends StatelessWidget {
  final String cHintText;
  final TextEditingController controller;
  const oTextField(
      {super.key, required this.cHintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: -7),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(255, 161, 158, 158),
        )),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.amber,
        )),
        hintText: cHintText,
        hintStyle: const TextStyle(
            color: Color.fromARGB(255, 124, 122, 122), fontSize: 18),
        prefixIcon: const Icon(
          Icons.height,
          color: Colors.amber,
        ),
      ),
    );
  }
}

Widget textoComNegrito(String resultadoIMC, String classificacaoIMC) {
  if (resultadoIMC.isNotEmpty && classificacaoIMC.isNotEmpty) {
    return RichText(
      text: TextSpan(
        text: 'Seu IMC é de ',
        style: const TextStyle(color: Colors.black, fontSize: 17),
        children: <TextSpan>[
          TextSpan(
            text: resultadoIMC,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
          ),
          const TextSpan(
            text: '\nClassificação: ',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          TextSpan(
            text: classificacaoIMC,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: retornaCorClassificacaoIMC(classificacaoIMC),
                fontSize: 18),
          ),
        ],
      ),
    );
  } else {
    return RichText(
      text: const TextSpan(
        text: '',
      ),
    );
  }
}
