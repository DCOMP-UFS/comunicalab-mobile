import 'package:comunica_mobile/pages/Software/bloc/software_bloc.dart';
import 'package:comunica_mobile/pages/Software/software_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Software extends StatelessWidget{

  showAlertDialog1(BuildContext context)
  {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      elevation: 100,
      title: Text(""),
      content: Text("Seu pedido foi solicitado!", style: TextStyle(fontSize: 20, ), textAlign: TextAlign.center),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  showAlertDialog2(BuildContext context) {
    Widget cancelaButton = FlatButton(
      child: Text("Cancelar"),
      onPressed:  () {Navigator.of(context).pop();},
    );
    Widget continuaButton = FlatButton(
      child: Text("OK"),
      onPressed:  () {
        Navigator.of(context).pop();
        showAlertDialog1(context);
        },
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Deseja requisitar os Softwares selecionados para \"Imagem 1\""),
      actions: [
        cancelaButton,
        continuaButton,
      ],
    );
    //exibe o diálogo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Adicionar Softwares"),
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
                  child: BlocBuilder<SoftwareBloc, int>(
                    builder: (context, state){
                      return RaisedButton(
                        onPressed: state > 0 ? () {
                          showAlertDialog2(context);
                        }: null,
                        color: Color(0xFF000080),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Text(
                          "Adicionar",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  )
              )
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
