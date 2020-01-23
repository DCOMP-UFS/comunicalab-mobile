import 'package:flutter/material.dart';

import '../../models/my_custom_clipper.dart';

class LabCallScreen extends StatefulWidget {
  final Map<String, dynamic> labData;

  LabCallScreen(this.labData);

  @override
  _LabCallScreenState createState() => _LabCallScreenState();
}

class _LabCallScreenState extends State<LabCallScreen> {
  var _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StripsWidget(
          color1: Color(0xff4343c3),
          color2: Color(0xff000080),
          gap: 500,
          noOfStrips: 2,
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  widget.labData['name'].toString(),
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Escolher tipo de problema',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            DropdownButtonFormField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              items: [
                                DropdownMenuItem(
                                  value: 0,
                                  child: Text(
                                    'Escolha o tipo de problema',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text(
                                    'Laboratório',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text(
                                    'Software',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text(
                                    'Hardware',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                )
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _currentValue = value;
                                });
                              },
                              value: _currentValue,
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              'Descrição',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Faça uma descrição sobre o problema',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              maxLines: 6,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Color(0xFF000080),
                                  splashColor: Colors.grey,
                                  child: Text(
                                    'Abrir Chamado',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
