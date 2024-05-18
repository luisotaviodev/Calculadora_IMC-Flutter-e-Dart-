import 'package:calculadora_imc/repository/historicoIMC.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_imc/pages/calcular_imc.dart';

class HistoricoIMCPage extends StatefulWidget {
  final List<PessoaIMC> historico;

  const HistoricoIMCPage({
    super.key,
    required this.historico,
  });

  @override
  State<HistoricoIMCPage> createState() => _HistoricoIMCPageState();
}

class _HistoricoIMCPageState extends State<HistoricoIMCPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Histórico"),
          titleTextStyle: const TextStyle(fontSize: 22),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CalculadoraIMC(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
        body: widget.historico.isEmpty
            ? const Center(
                child: Text(
                  'Não há histórico disponível.',
                  style: TextStyle(fontSize: 20),
                ),
              )
            : ListView.builder(
                itemCount: widget.historico.length,
                itemBuilder: (context, index) {
                  final pessoa = widget.historico[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Peso: ${pessoa.peso} kg\nAltura: ${pessoa.altura} m\nClassificação: ${pessoa.classificacao}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        const Text(
                          "01/02/2024",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
