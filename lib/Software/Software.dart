import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Software extends StatefulWidget {
  @override
  _SoftwareState createState() => _SoftwareState();
}

class _SoftwareState extends State<Software> {
  bool _chekBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("Adcionar Softwares")],
        )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: Color(0xFF000080))),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _chekBoxValue,
                          onChanged: (bool value) {
                            setState(() {
                              _chekBoxValue = value;
                            });
                          },
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Text(
                          "Software 1",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF000080)),
                        )
                      ],
                    )),
              ),
              SizedBox(
                width: 250,
                child: RaisedButton(
                  onPressed: () {},
                  color: Color(0xFF000080),
                  shape:  new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  child: Text(
                    "Adicionar",
                    style: TextStyle(color: Colors.white),
                  ),
              )
              )
            ],
          ),
          /* floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {},
        elevation: 0,
        backgroundColor: Color(0xFF000080),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/ //fimmmmmmmmmmmmmm
        ));
  }
}
