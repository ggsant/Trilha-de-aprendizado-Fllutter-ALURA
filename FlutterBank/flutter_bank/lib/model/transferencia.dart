class Transferencia {
  final int id;
  final double value;
  final int cpfNumber;
  final int accountNumber;

  Transferencia(
    this.id,
    this.value,
    this.cpfNumber,
    this.accountNumber,
  );
  @override
  String toString() {
    return 'Transferencia: id: $id, valor: $value,  cpfNumber: $cpfNumber, numConta: $accountNumber, ';
  }
}
