import 'package:flutter/material.dart';


class infoTela extends StatefulWidget {
  @override
  _infoTelaState createState() => _infoTelaState();
}

class _infoTelaState extends State<infoTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(""),
      ),
        bottomNavigationBar: Container(
            height: 60,
            child: Card(
                elevation: 8,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        height: 45,
                        width: 45,
                        child: FloatingActionButton(
                          backgroundColor: Color(0xFF000080),
                          child: Icon(
                            Icons.add,
                          ),
                          onPressed: () {},
                        ))
                  ],
                )))
    );
  }
}
