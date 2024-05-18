
import 'package:flutter/material.dart';
import 'package:calculadora_imc/pages/calcular_imc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme().apply()),
      home: const CalculadoraIMC(),
    );
  }
}
