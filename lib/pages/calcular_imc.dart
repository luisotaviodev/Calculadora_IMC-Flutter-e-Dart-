import 'package:calculadora_imc/backend/realizar_calcular_imc.dart';
import 'package:calculadora_imc/repository/historicoIMC.dart';
import 'package:flutter/material.dart';
import 'package:calculadora_imc/pages/historico_imc.dart';
import 'package:calculadora_imc/shared/widgets/text_field.dart';

// Lista de histórico global
List<PessoaIMC> historicoGlobal = [];

class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({super.key});

  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  var cAltura = TextEditingController(text: "");
  var cPeso = TextEditingController(text: "");
  double nValorIMC = 0.0;
  String cClassicacaoIMC = '';
  var cExibirResultadoIMC = '';
  var cTextoResultado = '';
  bool lCalculando = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      "https://guiadafarmacia.com.br/wp-content/uploads/2021/02/corpo-imc.jpg",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: cAltura,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: -7),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 161, 158, 158),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber,
                        ),
                      ),
                      hintText: "Digite sua Altura",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 124, 122, 122),
                        fontSize: 18,
                      ),
                      prefixIcon: Icon(
                        Icons.height,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: cPeso,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: -7),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 161, 158, 158),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber,
                        ),
                      ),
                      hintText: "Digite seu Peso",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 124, 122, 122),
                        fontSize: 18,
                      ),
                      prefixIcon: Icon(
                        Icons.balance,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: textoComNegrito(cExibirResultadoIMC, cClassicacaoIMC),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (cPeso.text.isNotEmpty &&
                              cAltura.text.isNotEmpty) {
                            nValorIMC = venCalcularIMC(double.parse(cPeso.text),
                                double.parse(cAltura.text));
                            cExibirResultadoIMC = nValorIMC.toStringAsFixed(2);
                            cClassicacaoIMC =
                                retornaClassificacaoIMC(nValorIMC);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Erro ao efetuar o Cálculo"),
                              ),
                            );
                          }

                          if (nValorIMC != 0.0 && cClassicacaoIMC.isNotEmpty) {
                            // cClassicacaoIMC =
                            //     "Seu IMC é de $cExibirResultadoIMC\n Classificação: $cClassicacaoIMC.";
                          }

                          // Adicionando a pessoa calculada à lista de histórico global
                          historicoGlobal.add(
                            PessoaIMC(
                              peso: cPeso.text,
                              altura: cAltura.text,
                              classificacao: retornaClassificacaoIMC(nValorIMC),
                            ),
                          );
                        });
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                      ),
                      child: const Text(
                        "Realizar Cálculo",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        // Navegando para a tela de histórico e passando o histórico de IMC global
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoricoIMCPage(
                              historico: historicoGlobal,
                            ),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                      ),
                      child: const Text(
                        "Histórico",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
