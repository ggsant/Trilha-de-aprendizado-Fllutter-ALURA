class Transferencia {
  final double valor;
  final int numeroConta;
  final String nome;

  Transferencia(
    this.valor,
    this.numeroConta,
    this.nome,
  );

  String toStringNome() {
    return '$nome';
  }

  String toStringValor() {
    return 'R\$ $valor';
  }

  String toStringConta() {
    return '$numeroConta';
  }

  @override
  String toString() {
    return 'Transferencia{nome: $nome, valor: $valor, numeroConta: $numeroConta}';
  }
}
