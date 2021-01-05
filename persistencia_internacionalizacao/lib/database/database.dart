import 'dart:async';

import 'package:path/path.dart';
import 'package:persistencia_internacionalizacao/model/contact.dart';
import 'package:sqflite/sqflite.dart';

//  função createDatabase() que, como o nome já diz, será responsável por criar o banco
Future<Database> createDatabase() {
  //função getDatabasePath() para pegarmos o caminho desse banco. Perceba que, ao fazermos isso, o pacote do sqflite será importado automaticamente. Quando realizamos esta chamada, nos é devolvido Future<String>, onde a string é o próprio caminho. Como já vimos, o Future deve ser acessado por meio do .then(). Ele demanda a implementação de uma função, nesse caso recebendo uma string que chamaremos de dbPath().

  return getDatabasesPath().then((dbPath) {
    // O próximo passo será criarmos o arquivo que representará o banco de dados, algo que será feito usando uma função da dependência path chamada join(). Essa função junta diversas strings que lhe são enviadas via argumento, e sua responsabilidade é fazer com que essa junção seja compatível com o sistema de arquivos (file system) do aparelho. Passaremos como argumento da função join() o debPath e o nome do arquivo que representará o banco de dados. É importante que esse arquivo tenha a extensão padrão .db, sendo assim, podemos chamá-lo de bytebank.db.
    final String path = join(dbPath, 'bytebank.db');

    //  função openDatabase(), que abrirá o banco de dados. Nela, além de enviarmos o path, teremos que fazer outras chamadas para conseguirmos criar a tabela no momento de abertura do banco e determinarmos a sua versão. Para a criação da tabela, usaremos a propriedade onCreate, que recebe uma função que tem como parâmetro um Database (no caso, db) e um inteiro que representa a versão (version). No corpo da função, a partir do db, poderemos executar algumas instruções referentes ao SQLite. Dentre elas, temos a db.execute(), que nos permitirá criar uma Query (um código em SQL).
    // Dentro de execute(), poderemos passar instruções do SQL, sempre em maiúsculo. Nesse caso, usaremos CREATE TABLE contacts, onde contacts é o nome da nossa tabela de contatos. Entre parênteses passaremos os campos que deverão ser criados, seguindo a sintaxe <nome da coluna> <tipo>, por exemplo id INTEGER. O id é um campo muito comum em diversos tipos de tabelas, e é utilizado para identificar registros individuais. Dado que ele será a nossa chave, informaremos também que ele é uma PRIMARY KEY.
    // O padrão é adicionarmos uma vírgula após o campo e, então, pular uma linha para continuar com a próxima coluna. Nesse caso, ela será name TEXT, onde TEXT é a representação de uma string no SQLite. Na sequência, vamos inserir o último campo, chamado account_number INTEGER. Note que, quando trabalhamos com banco de dados, é comum separarmos as palavras com underline (_).
    //Desta forma, teremos o código SQL que cria a tabela para nosso projeto. O último passo será determinar sua versão, algo feito por meio da propriedade version e um valor inteiro, que definiremos como 1. Assim, criamos o primeiro código que gera o banco de dados, a tabela e determina que todas as modificações feitas equivalem à versão 1.
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)',
        );
      },
      version: 1,
    );
  });
}

// Já escrevemos o código que cria o banco de dados e, nesse passo, implementaremos tanto o código que armazena um contato quanto o que recupera a informação salva. Ainda no arquivo app_database.dart, definiremos uma função save() que receberá como parâmetro um Contact (que precisaremos importar).

Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;

    return db.insert(
      'contacts',
      contactMap,
    );
  });
}

// O próximo passo será criar a função para buscar as informações. Declararemos então a função findAll(), que buscará todos os contatos. Seguindo a mesma metodologia, chamaremos createDatabase().then() recebendo um (db).
Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = List();
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
