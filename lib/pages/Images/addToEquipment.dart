import 'package:comunica_mobile/pages/Images/bloc/bloc.dart';
import 'package:comunica_mobile/pages/Images/widgets_addToEquipment.dart/customCard.dart';
import 'package:comunica_mobile/pages/Images/widgets_addToEquipment.dart/filterBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToEquipment extends StatefulWidget {
  @override
  _AddToEquipmentState createState() => _AddToEquipmentState();
}

class _AddToEquipmentState extends State<AddToEquipment> {
  bool valor = false;
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Adicionar à Equipamentos",
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
            onPressed: () async {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.0),
                  ),
                ),
                builder: (_) {
                  return SingleChildScrollView(child: ModalCustom(null, null));
                },
              ).then((filter) {
                BlocProvider.of<AddToEquipmentBloc>(context).add(ApplyFilter(filter));
                print(BlocProvider.of<AddToEquipmentBloc>(context).state.equipments);
              });
            },
            icon: Icon(Icons.filter_list),
            color: Colors.white,
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<AddToEquipmentBloc, AddToEquipmentState>(
        builder: (context, state) {
          if (state is AddToEquipmentSuccess) {
            return Container(
              margin: EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: state.equipments.length,
                itemBuilder: (context, index) {
                  return BlocProvider.value(
                    value: BlocProvider.of<AddToEquipmentBloc>(context),
                    child: CustomCard(equipment: state.equipments[index]),
                  );
                },
              ),
            );
          } else if (state is AddToEquipmentLoading) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            );
          } else {
            return Container(
              width: 10,
              height: 10,
              color: Colors.blue,
            );
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<AddToEquipmentBloc, AddToEquipmentState>(
        builder: (context, state) {
          if (state is AddToEquipmentLoading) {
            return Container(
              width: 0,
              height: 0,
            );
          } else {
            return Card(
              elevation: 8,
              child: Container(
                padding: EdgeInsets.fromLTRB(mediaQuery.width * 0.30, 10, mediaQuery.width * 0.30, 10),
                child: BlocBuilder<AddToEquipmentBloc, AddToEquipmentState>(
                  builder: (context, state) {
                    if (state is AddToEquipmentSuccess) {
                      if (state.equipments.where((e) => e.isMarked == true).toList().length > 0 && state.equipments != null) {
                        return GestureDetector(
                          onTap: () {
                            openDialog(context, BlocProvider.of<AddToEquipmentBloc>(context));
                          },
                          child: Container(
                            height: 32,
                            width: 60,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFF000080),
                              borderRadius: BorderRadius.circular(14),
                            ),
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
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 32,
                            width: 60,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFF000080),
                              borderRadius: BorderRadius.circular(14),
                            ),
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
                        );
                      }
                    } else if (state is AddToEquipmentLoading) {
                      return Container(width: 0, height: 0);
                    } else {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 32,
                          width: 60,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xFF000080),
                            borderRadius: BorderRadius.circular(14),
                          ),
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
                      );
                    }
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

openDialog(BuildContext context, AddToEquipmentBloc bloc) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        'Deseja requisitar "Imagem 1" nos Equipamentos selecionados?',
        style: TextStyle(fontWeight: FontWeight.w900),
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                title: Text(
                  'Seu pedido foi solicitado!',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
            ).then((value) => bloc.add(ClearMarkedEquipments()));
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
    ),
  );
}
