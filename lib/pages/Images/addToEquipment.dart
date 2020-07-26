import 'package:comunica_mobile/pages/Images/bloc/bloc.dart';
import 'package:comunica_mobile/pages/Images/widgets_addToEquipment.dart/customCard.dart';
import 'package:flutter/material.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToEquipment extends StatefulWidget {
  @override
  _AddToEquipmentState createState() => _AddToEquipmentState();
}

class _AddToEquipmentState extends State<AddToEquipment> {
  bool valor = false;
  int contador = 0;

  // verificarSelecionado() {
  //   final bloc = BlocProvider.of<AddToEquipmentBloc>(context);
  //   bloc.
  // }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            icon: Icon(Icons.filter_list),
            color: Colors.white,
          )
        ],
      ),
      drawer: handlerSideBar(context),
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
                  // return CustomCard('${state.equipments[index].name}', verificarSelecionado);
                },
              ),
            );
          } else if (state is AddToEquipmentLoading) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            );
          } else if (state is AddToEquipmentMethod) {
            return Container(
              margin: EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: state.equipments.length,
                itemBuilder: (context, index) {
                  return BlocProvider.value(
                    value: BlocProvider.of<AddToEquipmentBloc>(context),
                    child: CustomCard(equipment: state.equipments[index]),
                  );
                  // return CustomCard('${state.equipments[index].name}', verificarSelecionado);
                },
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
      bottomNavigationBar: Card(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.fromLTRB(130, 10, 130, 10),
          child: BlocBuilder<AddToEquipmentBloc, AddToEquipmentState>(
            builder: (context, state) {
              if (state is AddToEquipmentSuccess) {
                if (state.equipments.where((e) => e.isMarked == true).toList().length > 0) {
                  return GestureDetector(
                    onTap: () {
                      openDialog(context);
                      state.equipments.map((eqp) => eqp.isMarked = false);
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
      ),
    );
  }
}

openDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
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
                      title: Text('Seu pedido foi solicitado!'),
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
    ),
  );
}
