import 'package:comunica_mobile/pages/Images/widgets/customDialog.dart';
import 'package:comunica_mobile/widgets/customCard.dart';
import 'package:flutter/material.dart';

class softwareTela extends StatefulWidget {
  @override
  _softwareTelaState createState() => _softwareTelaState();
}

class _softwareTelaState extends State<softwareTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return CustomCard('Software ${index + 1}');
            },
          ),
        ),
        bottomNavigationBar: Container(
            height: 60,
            child: Card(
                elevation: 8,
                child: Row(
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
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => CustomDialog()
                            );
                          },
                        ))
                  ],
                ))));
  }
}
