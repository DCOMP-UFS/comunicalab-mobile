import 'package:comunica_mobile/pages/Images/imagesDetails.dart';
import 'package:comunica_mobile/pages/Images/imagesInfo.dart';
import 'package:comunica_mobile/pages/Images/widgets/customBackground.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class infoTela extends StatefulWidget {

final imagesInfo imag;
infoTela(this.imag);

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
              children: <Widget>[
                Container(
                  width: 320,
                  height: 100,

                  //margin: EdgeInsets.fromLTRB(30,30,30,30),
                  decoration: new BoxDecoration(
                      color: Color(0xFFF9FDFF),
                      borderRadius: BorderRadius.circular(20
                      )),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(

                          child: Text("Nome",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.black, width: 0.3 )
                        ),
                        elevation: 5,
                        margin: EdgeInsets.fromLTRB(15,0,15,8),
                        child: Container(
                          height: 50,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                widget.imag.softwareName
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 152,
                        height: 100,
                        decoration: new BoxDecoration(
                            color: Color(0xFFF9FDFF),
                            borderRadius: BorderRadius.circular(20
                            )),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: Text("Data de Criação",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                           Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.black, width: 0.3 )
                            ),
                            elevation: 5,
                            margin: EdgeInsets.fromLTRB(15,0,15,8),
                            child: Container(
                              height: 50,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                    widget.imag.dataCriacao,
                                ),
                              ),
                            ),
                          ),
                          ],
                        ),
                      ),
                      Container(
                        width: 10,
                      ),
                      Container(
                        width: 152,
                        height: 100,
                        decoration: new BoxDecoration(
                            color: Color(0xFFF9FDFF),
                            borderRadius: BorderRadius.circular(20
                            )),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: Text("N de instalações",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.black, width: 0.3 )
                              ),
                              elevation: 5,
                              margin: EdgeInsets.fromLTRB(15,0,15,8),
                              child: Container(
                                height: 50,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                      widget.imag.numeroInstalacoes,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 152,
                        height: 100,
                        decoration: new BoxDecoration(
                            color: Color(0xFFF9FDFF),
                            borderRadius: BorderRadius.circular(20
                            )),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: Text("N de Softwares\n    Instalados",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.black, width: 0.3 )
                              ),
                              elevation: 5,
                              margin: EdgeInsets.fromLTRB(15,0,15,8),
                              child: Container(
                                height: 50,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.imag.numeroInstalacoes,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 10,
                      ),
                      Container(
                        width: 152,
                        height: 100,
                        decoration: new BoxDecoration(
                            color: Color(0xFFF9FDFF),
                            borderRadius: BorderRadius.circular(20
                            )),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: Text("    Última \nAtualização",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.black, width: 0.3 )
                              ),
                              elevation: 5,
                              margin: EdgeInsets.fromLTRB(15,0,15,8),
                              child: Container(
                                height: 50,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    widget.imag.ultimaAtualizacao,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
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
