class Saldo {
  final double valor;
  Saldo(this.valor);

  @override
  String toString() {
    return 'R\$ $valor';
  }
}
