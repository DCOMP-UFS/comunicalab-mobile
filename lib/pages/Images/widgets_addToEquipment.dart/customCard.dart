import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String softwareName;
  final void Function(int) quandoSelecionar;

  CustomCard(this.softwareName, this.quandoSelecionar);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool valor = false;

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
                          widget.quandoSelecionar(1);
                        } else {
                          widget.quandoSelecionar(-1);
                        }
                      });
                    },
                    value: valor,
                    activeColor: Color(0xFF000080),
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
