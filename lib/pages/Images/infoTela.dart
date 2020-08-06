import 'package:comunica_mobile/pages/Images/widgets/customBackground.dart';
import 'package:flutter/material.dart';


class infoTela extends StatefulWidget {
  @override
  _infoTelaState createState() => _infoTelaState();
}

class _infoTelaState extends State<infoTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF000080),
      body: Container(
        child: CustomPaint(
          painter: customBackground(),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 400,
                  height: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: SizedBox(
                      width: 30,
                      height: 50,
                      child: Card(
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 160,
                        height: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text(
                              "Data de criação",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        height: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text(
                              "N de instalações",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ),
                      ),
                      //SizedBox(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 160,
                        height: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text(
                              "N de Softwares Instalados",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        height: 100,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text(
                              "Última Atualização",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ),
                      ),
                      //SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
