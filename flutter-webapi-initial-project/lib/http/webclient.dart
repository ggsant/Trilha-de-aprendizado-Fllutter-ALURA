import 'dart:convert';

import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../models/contact.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('url: $data.baseUrl');
    print('body: $data.body');
    print('header: $data.headers');

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('body: $data.body');
    print('header: $data.headers');
    print('status code: $data.statusCode');
    print(data);
    return data;
  }
}

Future<List<Transaction>> findAll() async {
  final Client client =
      HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
  final Response response =
      await client.get('http://192.168.0.7:8080/transactions');
  final List<dynamic> decodedJson = jsonDecode(response.body);

  final List<Transaction> transactions = List();

  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contatac'];
    final Transaction transaction = Transaction(
      transactionJson['value'],
      Contact(
        0,
        transactionJson['name'],
        transactionJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}
