import 'package:flutter/material.dart';
import 'package:flutter_bank/components/customCard.dart';
import 'package:flutter_bank/components/title.dart';

class PageOneMenu extends StatefulWidget {
  @override
  _PageOneMenuState createState() => _PageOneMenuState();
}

class _PageOneMenuState extends State<PageOneMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            TitleFont(
              text: 'Notificações',
              fontSize: 30,
            ),
            CustomCardPageTwo(
              added: true,
              name: "Nova transferência.",
              text:
                  "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
              onPressed: () {},
              imgPath: "assets/logo2.png",
            ),
            CustomCardPageTwo(
              added: true,
              name: "Nova transferência.",
              text:
                  "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
              onPressed: () {},
              imgPath: "assets/logo2.png",
            ),
            CustomCardPageTwo(
              added: true,
              name: "Nova transferência.",
              text:
                  "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
              onPressed: () {},
              imgPath: "assets/logo2.png",
            ),
            CustomCardPageTwo(
              added: true,
              name: "Nova transferência.",
              text:
                  "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
              onPressed: () {},
              imgPath: "assets/logo2.png",
            ),
            CustomCardPageTwo(
              added: true,
              name: "Nova transferência.",
              text:
                  "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
              onPressed: () {},
              imgPath: "assets/logo2.png",
            ),
            CustomCardPageTwo(
              added: true,
              name: "Nova transferência.",
              text:
                  "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
              onPressed: () {},
              imgPath: "assets/logo2.png",
            ),
            CustomCardPageTwo(
              added: true,
              name: "Nova transferência.",
              text:
                  "Gabriela transferiu RS500,00 para a sua \nFluConta. Veja agora.",
              onPressed: () {},
              imgPath: "assets/logo2.png",
            ),
          ],
        ),
      ),
    );
  }
}
