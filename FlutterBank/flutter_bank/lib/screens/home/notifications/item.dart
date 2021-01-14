import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String _valor;
  String _nome;
  String _conta;
  String _tipo;
  final Map<String, Color> _cores = {
    'debito': Colors.red,
    'credito': Colors.green,
  };

  Item(this._valor, this._conta, this._tipo, this._nome);

  Item.transferencia(this._valor, this._conta, this._nome) {
    this._tipo = 'debito';
  }
  Item.deposito(this._valor) {
    this._tipo = 'credito';
    this._conta = '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              )
            ],
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: [
              Icon(
                Icons.monetization_on,
                color: _cores[_tipo],
              ),
              SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Você fez uma transferência para a conta\n $_conta no valor de $_valor \n $_nome',
                    style: TextStyle(
                      color: Color.fromRGBO(83, 109, 254, 1),
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: 5.0),
                  // Text(
                  //   _valor,
                  //   style: TextStyle(
                  //     color: Color.fromRGBO(83, 109, 254, 1),
                  //     fontFamily: 'Varela',
                  //     fontSize: 14.0,
                  //   ),
                  // ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
    // return Card(
    //     child: ListTile(
    // leading: Icon(
    //   Icons.monetization_on,
    //   color: _cores[_tipo],
    // ),
    //   title: Text(_valor),
    //   subtitle: Text(_conta),
    // ));
  }
}
