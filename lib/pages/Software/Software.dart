import 'package:comunica_mobile/pages/Software/bloc/software_bloc.dart';
import 'package:comunica_mobile/pages/Software/software_list.dart';
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
            children: [
              Text("Adcionar Softwares"),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SoftwareList("Software 1"),
              SoftwareList("Software 2"),
              SoftwareList("Software 3"),
              SoftwareList("Software 4"),
              SoftwareList("Software 5"),
              SoftwareList("Software 6"),
              SoftwareList("Software 7"),
              SizedBox(
                  width: 250,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Color(0xFF000080),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
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
