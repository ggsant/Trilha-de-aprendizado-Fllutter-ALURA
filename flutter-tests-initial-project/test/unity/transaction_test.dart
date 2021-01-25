import 'package:flutter_test/flutter_test.dart';

import '../../lib/models/transaction.dart';

void main() {
  // testes de unidade
  test('Deve retornar o valor quando criarmos uma transação', () {
    final transaction = Transaction(null, 200, null);
    expect(transaction.value, 200);
  });

  test('Deve falhar quando criar uma transferencia com valor menor que zero',
      () {
    expect(() => Transaction(null, 0, null), throwsAssertionError);
  });
}
