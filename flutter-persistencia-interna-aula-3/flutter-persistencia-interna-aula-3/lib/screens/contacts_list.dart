import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

import '../database/app_database.dart';
import '../models/contact.dart';

class ContactsList extends StatefulWidget {
  // final List<Contact> contacts = List();
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    // contacts.add(Contact(0, 'Gabriela', 1000)); - para testar

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // quando o future não foi executado ainda
              break;
            case ConnectionState.waiting:
              // estado que verifica que o future esta carregando
              return Center(
                child: CircularProgressIndicator(backgroundColor: Colors.green),
              );
              break;
            case ConnectionState.active:
              // quando o future ta ativo, stream, ele devolve os valores de um dowload por ex
              break;
            case ConnectionState.done:
              // quando o future esta completo
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return _ContactItem(contact);
                },
                itemCount: contacts.length,
              );
              break;
          }
          return Text('Error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then((value) {
            setState(() {
              widget.createState();
            });
          });
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  _ContactItem(this.contact);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
