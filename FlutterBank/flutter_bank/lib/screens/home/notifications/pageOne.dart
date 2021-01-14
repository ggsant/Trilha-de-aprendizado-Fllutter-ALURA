import 'package:flutter/material.dart';
import 'package:flutter_bank/components/customCard.dart';
import 'package:flutter_bank/components/title.dart';
import 'package:flutter_bank/model/transferencia.dart';
import 'package:flutter_bank/model/transferencias.dart';
import 'package:flutter_bank/screens/home/transfer/formulario_transferencia.dart';
import 'package:provider/provider.dart';

import 'item.dart';

class PageOneMenu extends StatefulWidget {
  @override
  _PageOneMenuState createState() => _PageOneMenuState();
}

class _PageOneMenuState extends State<PageOneMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Transferencias>(
        builder: (context, transferencias, child) {
          return ListView.builder(
            itemCount: transferencias.transferencias.length,
            itemBuilder: (context, indice) {
              final transferencia = transferencias.transferencias[indice];

              return Item.transferencia(
                transferencia.toStringValor(),
                transferencia.toStringConta(),
                transferencia.toStringNome(),
              );
            },
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) {
      //       return FormsTransferencia();
      //     }));
      //   },
      // ),
    );
  }
}

// class ItemTransferencia extends StatelessWidget {
//   final Transferencia _transferencia;

//   ItemTransferencia(this._transferencia);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: _buildCard(context),
//     );

//     // return Card(
//     //     child: ListTile(
//     //   leading: Icon(Icons.monetization_on),
//     //   title: Text(_transferencia.toStringValor()),
//     //   subtitle: Text(_transferencia.toStringConta()),
//     // ));
//   }

//   Widget _buildCard(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
//       child: InkWell(
//         onTap: () {},
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15.0),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 3.0,
//                 blurRadius: 5.0,
//               )
//             ],
//             color: Colors.white,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Row(children: [
//               Container(
//                 height: 20.0,
//                 width: 20.0,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("assets/logo2.png"),
//                       fit: BoxFit.contain),
//                 ),
//               ),
//               SizedBox(width: 15.0),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     _transferencia.toStringValor(),
//                     style: TextStyle(
//                       color: Color.fromRGBO(83, 109, 254, 1),
//                       fontFamily: 'Varela',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 5.0),
//                   Text(
//                     _transferencia.toStringConta(),
//                     style: TextStyle(
//                       color: Color.fromRGBO(83, 109, 254, 1),
//                       fontFamily: 'Varela',
//                       fontSize: 14.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class PageOneMenu extends StatefulWidget {
// //   @override
// //   _PageOneMenuState createState() => _PageOneMenuState();
// // }

// // class _PageOneMenuState extends State<PageOneMenu> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             SizedBox(height: 10.0),
// //             TitleFont(
// //               text: 'Notificações',
// //               fontSize: 30,
// //             ),
// //             CustomCardPageTwo(
// //               added: true,
// //               name: "Nova transferência.",
// //               text:
// //                   "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
// //               onPressed: () {},
// //               imgPath: "assets/logo2.png",
// //             ),
// //             CustomCardPageTwo(
// //               added: true,
// //               name: "Nova transferência.",
// //               text:
// //                   "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
// //               onPressed: () {},
// //               imgPath: "assets/logo2.png",
// //             ),
// //             CustomCardPageTwo(
// //               added: true,
// //               name: "Nova transferência.",
// //               text:
// //                   "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
// //               onPressed: () {},
// //               imgPath: "assets/logo2.png",
// //             ),
// //             CustomCardPageTwo(
// //               added: true,
// //               name: "Nova transferência.",
// //               text:
// //                   "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
// //               onPressed: () {},
// //               imgPath: "assets/logo2.png",
// //             ),
// //             CustomCardPageTwo(
// //               added: true,
// //               name: "Nova transferência.",
// //               text:
// //                   "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
// //               onPressed: () {},
// //               imgPath: "assets/logo2.png",
// //             ),
// //             CustomCardPageTwo(
// //               added: true,
// //               name: "Nova transferência.",
// //               text:
// //                   "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
// //               onPressed: () {},
// //               imgPath: "assets/logo2.png",
// //             ),
// //             CustomCardPageTwo(
// //               added: true,
// //               name: "Nova transferência.",
// //               text:
// //                   "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
// //               onPressed: () {},
// //               imgPath: "assets/logo2.png",
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
