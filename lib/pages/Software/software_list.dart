import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'bloc/software_bloc.dart';

class SoftwareList extends StatelessWidget {

  bool _chekBoxValue = false;
  String nomeSoft;

  SoftwareList(this.nomeSoft);

  SoftwareBloc bloc = SoftwareBloc();

  @override
  void dispose(){
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
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
                  StreamBuilder<bool>(
                    stream: bloc,
                    builder: (context, snapshot){
                      return Checkbox(
                        value: _chekBoxValue,
                        onChanged: (bool value ) {
                          bloc.add(value);
                          _chekBoxValue = value;
                        },
                      );
                    }
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