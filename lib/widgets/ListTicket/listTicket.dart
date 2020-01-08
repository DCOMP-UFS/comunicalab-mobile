import 'dart:async';

import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';



const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 18);
const TextStyle subtitleStyle = TextStyle(color: Colors.white, fontSize: 12);
int controller = 4;
TextEditingController textController = TextEditingController();
StreamController textType = StreamController();



AppBar listTicketAppbar(Map labData){
  return AppBar(
    title: BlocBuilder<FilterticketBloc, FilterticketState>(
      builder: (context, state) {
        if (state is ByName) {
          return textBar(textController, state is ByName ? 'nome' : 'local');
        } else {
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Lista de Chamados", style: titleStyle),
            Text(labData['name'], style: subtitleStyle),
          ],
        );
      }
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(45),
      child: BlocBuilder<FilterticketBloc, FilterticketState>(
        builder: (context, state) {
          if (state is ChoosingStatus) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                statusButton("Finalizado", () => BlocProvider.of<FilterticketBloc>(context).add(ToStatus(status: "Finalizado"))),
                statusButton("Andamento", () => BlocProvider.of<FilterticketBloc>(context).add(ToStatus(status: "Andamento"))),
                statusButton("Pendente", () => BlocProvider.of<FilterticketBloc>(context).add(ToStatus(status: "Pendente"))),
                statusButton("Cancelado", () => BlocProvider.of<FilterticketBloc>(context).add(ToStatus(status: "Cancelado"))),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                filterButton("Status", state is ByStatus, () => BlocProvider.of<FilterticketBloc>(context).add(ToChooseStatus())),
                filterButton("Data", state is ByDate, () => BlocProvider.of<FilterticketBloc>(context).add(ToDate())),
                filterButton("Tipo", state is ByType, () => BlocProvider.of<FilterticketBloc>(context).add(ToType())),
                filterButton("Nome", state is ByName, () => BlocProvider.of<FilterticketBloc>(context).add(ToName())),
              ],
            );
          }
        },
      ),
    ),
  );
}

Widget listTicketBody(Map labData){
  textController.addListener((){
    textType.add(true);
  });
  return BlocProvider(
    create: (context) => ListTicketBloc(),
    child: BlocBuilder<FilterticketBloc, FilterticketState>(
      builder: (context, filterState) {
        return BlocBuilder<ListTicketBloc, ListTicketState>(
          builder: (context, state) {
            if(BlocProvider.of<ListTicketBloc>(context).state is InitialListTicketState){
              BlocProvider.of<ListTicketBloc>(context).add(ListTicketLoad(labId: labData['id']));
            }
            if (state is ListTicketLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if(state is ListTicketSuccess){
                return StreamBuilder(
                  stream: textType.stream,
                  builder: (context, snapshot){
                    List<Map> labs = [];
                    if (filterState is ByName) {
                      state.labs.forEach((lab){
                        if (lab["title"].contains(textController.text)) {
                          labs.add(lab); 
                        }
                      });
                    } else {
                      if (filterState is ByStatus) {
                        state.labs.forEach((lab){
                          if(lab['lastProgress']['status'] == filterState.status) {
                            labs.add(lab);
                          }
                        });
                      } else {
                        labs = state.labs;
                      }
                    }
                    return ListView.builder(
                      itemCount: labs.length,
                      itemBuilder: (context, int index){
                        return ticketCard(labs[index], labData);
                      }
                    );
                  },
                );
              } else {
                return Center();
              }
            }
          },
        );
      },
    ),
  );
}

Widget ticketCard(Map ticketData, Map labData){
  return Container(
    padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
    child: Card(
      elevation: 5,
      child: Container(      
        padding: EdgeInsets.fromLTRB(57, 12, 57, 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(ticketData['title'], style: TextStyle(fontSize: 20)),
            Text(labData['name'], style: TextStyle(fontSize: 18)),
            ticketTimeRow(DateTime.parse(ticketData["lastProgress"]["progressed_at"])),
            ticketProgressRow(ticketData["lastProgress"]["status"]),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
    ),
  );
}

Row ticketProgressRow(String status){
  return Row(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(right: 8),
        height: 5,
        width: 37,
        alignment: AlignmentDirectional.centerStart,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xFFC4C4C4),
        ),
        child: Container(
          height: 5,
          width: (status == "Pendente") ? 11 : (status == "Andamento") ? 26 : 37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            color: (status == "Pendente") ? Color(0xFFF41616) : (status == "Andamento") ? Color(0xFFFFF500) : Color(0xFF00FF29),
          ),
        ),
      ),
      Text(status, style: TextStyle(fontSize: 11),)
    ],
  );
}

Container ticketTimeRow(DateTime date){
  return Container(
    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
    child: Row(
      children: <Widget>[
        Icon(CustomIcons.ajuda, size: 13),
        Text("  ${date.day.toString()}/${date.month.toString()}/${date.year.toString()}  ", style: TextStyle(fontSize: 11)),
        Icon(CustomIcons.ajuda, size: 13),
        Text("  ${date.hour.toString()}:${date.minute.toString()}", style: TextStyle(fontSize: 11)),
      ],
    ),
  );
}

GestureDetector filterButton(String text, bool status, Function onTap){
  Color _primaryColor = Color(0xFF000080);
  return GestureDetector(
    child: Container(
      width: 83,
      height: 22,
      margin: EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: status ? _primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: status ? 1 : 0,
          color: Colors.white,
        )
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: status ? Colors.white : _primaryColor,
            fontSize: 14
          ),
        ),
      ),
    ),
    onTap: () async {
      onTap();
    },
  );
}

Widget statusButton(String status, Function onTap){
  var color = status == "Finalizado" ? Color(0xFF00FF29) : status == "Andamento" ? Color(0xFFFFF500) : status == "Cancelado" ? Color(0xFFFF7700) : Color(0xFFFF0000);
  return GestureDetector(
    child: Container(
      width: 83,
      height: 22,
      margin: EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14
          ),
        ),
      ),
    ),
    onTap: () async {
      onTap();
    },
  );
}

Widget textBar(TextEditingController controller, String type){
  return Container(
    height: 30,
    child: Card(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      child: TextField(
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12, 6, 0, 0),
          hintText: 'Digite o $type ...',
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    )
  );
}