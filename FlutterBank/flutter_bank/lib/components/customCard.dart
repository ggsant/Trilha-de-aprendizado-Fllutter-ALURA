import 'package:flutter/material.dart';

class CustomCardPageTwo extends StatelessWidget {
  final String imgPath;
  final String name;
  final String text;
  final bool added;
  final Function onPressed;

  const CustomCardPageTwo({
    Key key,
    this.added,
    this.name,
    this.onPressed,
    this.imgPath,
    this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: _buildCard(context),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: onPressed,
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
            padding: const EdgeInsets.all(5.0),
            child: Row(children: [
              Container(
                height: 20.0,
                width: 20.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.contain),
                ),
              ),
              SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Color.fromRGBO(83, 109, 254, 1),
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    text,
                    style: TextStyle(
                      color: Color.fromRGBO(83, 109, 254, 1),
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
