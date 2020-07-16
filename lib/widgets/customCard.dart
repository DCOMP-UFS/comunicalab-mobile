import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String softwareName;

  CustomCard(this.softwareName,);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool valor = true;
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {},
          child: Container(
              padding: EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    onChanged: (marcacao) {
                      setState(() {
                        valor = marcacao;
                        if (valor == true) {
                          contador += 1;
                        } else {
                          contador -= 1;
                        }
                      });
                    },
                    value: valor,
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(widget.softwareName),
                ],
              )),
        ),
      ),
    );
  }
}
