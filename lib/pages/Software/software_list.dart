import 'package:comunica_mobile/pages/Software/Software.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoftwareList extends StatelessWidget {

  PageController controller = new PageController();
  bool _chekBoxValue = false;
  String nomeSoft;

  SoftwareList(this.nomeSoft, this._chekBoxValue);

  @override
  Widget build(BuildContext context){
    // TODO: implement build
    return Column(
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
                      // setState = setState(() {
                      _chekBoxValue = value;
                      //});
                    },
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Text(
                    nomeSoft,
                    style:
                    TextStyle(fontSize: 16, color: Color(0xFF000080)),
                  )
                ],
              )),
        ),
      ],
    );
  }




}