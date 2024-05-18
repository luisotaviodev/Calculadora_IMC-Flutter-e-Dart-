class PessoaIMC {
  final String peso;
  final String altura;
  final String classificacao;

  PessoaIMC({
    required this.peso,
    required this.altura,
    required this.classificacao,
  });

  String obterInformacoes() {
    return "Peso: $peso kg\nAltura: $altura m\nClassificação: $classificacao";
  }
}
