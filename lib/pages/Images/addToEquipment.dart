import 'package:comunica_mobile/widgets/CommomNavigator/commomNavigator.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/customBottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/widgets/customCard.dart';

class AddToEquipment extends StatefulWidget {
  @override
  _AddToEquipmentState createState() => _AddToEquipmentState();
}

class _AddToEquipmentState extends State<AddToEquipment> {
  bool valor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Adicionar à equipamentos",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Imagem 1",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.filter_list),
              color: Colors.white,
            )
          ],
        ),
        drawer: handlerSideBar(context),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return CustomCard('Equipamento ${index + 1}');
            },
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          child: Card(
              elevation: 8,
              child: valor
                  ? Row(
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
                    )
                  : GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                    'Deseja requisitar "Imagem 1" nos Equipamentos selecionados?',
                                    style: TextStyle(fontWeight: FontWeight.w800),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Cancelar',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title: Text('Seu pedido foi solicitado'),
                                                ));
                                      },
                                      child: Text(
                                        'Ok',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ));
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        color: Color(0xFF000080),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Adicionar',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )),
        ));
  }
}
