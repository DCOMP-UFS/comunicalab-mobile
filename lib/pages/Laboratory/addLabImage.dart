import 'package:comunica_mobile/models/ticket.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/ticketCardLaboratoryImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'addLabImage_List.dart';
import 'bloc/addLabImage_bloc.dart';


class AddLabImage extends StatelessWidget {

   Ticket _ticket1 = new Ticket(status: "Livre");
   Ticket _ticket2 = new Ticket(status: "Reservado");
   Ticket _ticket3 = new Ticket(status: "Ocupado");


  showAlertDialog1(BuildContext context)
  {
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15)
      ),
      elevation: 100,
      title: Text(
          "Seu pedido foi solicitado!",
          style: TextStyle(fontSize: 20, ),
          textAlign: TextAlign.center
      ),
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
      child: Text("Cancelar", style: TextStyle(fontSize: 20, color: Colors.black54),),
      onPressed:  () {Navigator.of(context).pop();},
    );
    Widget continuaButton = FlatButton(
      child: Text("OK", style: TextStyle(fontSize: 20, color: Colors.black54),),
      onPressed:  () {
        Navigator.of(context).pop();
        showAlertDialog1(context);
      },
    );
    //configura o AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Deseja requisitar \"Imagem 1\" nos Laboratórios selecionados?",
        style: TextStyle(),
        textAlign: TextAlign.center,
      ),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(15)
      ),
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
    final mediaQuery = MediaQuery.of(context).devicePixelRatio * MediaQuery.of(context).size.width;
    return Scaffold(

        appBar: AppBar(
          title:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Adicionar à Laboratórios"),
              Text("Imagem 1", style: TextStyle(fontSize: 10),),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {},
            )
          ],
        ),
        bottomNavigationBar: Card(
          elevation: 8,
          child: Container(

            padding: (mediaQuery > 700)? EdgeInsets.fromLTRB(90, 10, 90, 10) : EdgeInsets.fromLTRB(30, 10, 30, 10),
            height: 60,
            width: 360,
            child: BlocBuilder<AddLabImage_Bloc, int>(
              builder: (context, state){
                return  RaisedButton(
                    onPressed: state > 0 ? () {
                      showAlertDialog2(context);
                    }: null,
                    color: Color(0xFF000080),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    padding: EdgeInsets.all(0),
                  );
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 3, right: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TicketCardLaboratoryImage(_ticket1, "Laboratório de Hardware", "Departamento"),
                    TicketCardLaboratoryImage(_ticket1, "Laboratório de Hardware 2", "Departamento"),
                    TicketCardLaboratoryImage(_ticket2, "Laboratório de Hardware", "Departamento"),
                    TicketCardLaboratoryImage(_ticket2, "Laboratório de Hardware", "Departamento"),
                    TicketCardLaboratoryImage(_ticket3, "Laboratório de Hardware", "Departamento"),

                  ],
                ),
              ),
            )
        )
    );
  }
}
