import 'dart:async';
//import 'dart:js';

import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/models/user.dart';
import 'package:comunica_mobile/widgets/FilterWidgets/filterBottomSheet.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/slidable_widget.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/ticketCard.dart';
import 'package:comunica_mobile/widgets/errorWidget.dart';
import 'package:comunica_mobile/widgets/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 18);
const TextStyle subtitleStyle = TextStyle(color: Colors.white, fontSize: 12);
int controller = 4;
TextEditingController textController = TextEditingController();
StreamController textType = StreamController();

/*
O filtro Não funciona se chamar o AppBar sozinho
AppBar listTicketAppbar(Map labData, BuildContext context) {
  return AppBar(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Lista de Chamados", style: titleStyle),
        Text(labData['name'], style: subtitleStyle),
      ],
    ),
    actions: [
      BlocBuilder<ListTicketBloc, ListTicketState>(builder: (context, state) {
        return IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () async {
            if (state is ListTicketSuccess) {
              filterBottomSheet(
                      context: context,
                      dateTime: state.filter["dateTime"],
                      ticketStatus: state.filter["ticketStatus"],
                      troubleType: state.filter["troubleType"])
                  .then((filter) {
                BlocProvider.of<ListTicketBloc>(context)
                    .add(ApplyFilterLabTicket(filter));
              });
            }
          },
        );
      }),
    ],
  );

}*/

Widget listTicketBody(Map labData) {
  User _user = new User(); //Para debug
  return BlocBuilder<ListTicketBloc, ListTicketState>(
      builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Lista de Chamados", style: titleStyle),
            Text(labData['name'], style: subtitleStyle),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () async {
              if (state is ListTicketSuccess) {
                filterBottomSheet(
                        context: context,
                        dateTime: state.filter["dateTime"],
                        ticketStatus: state.filter["ticketStatus"],
                        troubleType: state.filter["troubleType"])
                    .then((filter) {
                  BlocProvider.of<ListTicketBloc>(context)
                      .add(ApplyFilterLabTicket(filter));
                });
              }
            },
          ),
        ],
      ),
      body: state is ListTicketLoading
          ? LoadingWidget(message: 'Carregando Chamados')
          : state is ListTicketSuccess
              ? ListView.builder(
                  itemCount: state?.labsTickets?.length,
                  itemBuilder: (context, int index) {
                    return _user.getUser ==
                                state.labsTickets[index].requestingUser &&
                            state.labsTickets[index].status ==
                                'Pendente' //TODO: checar o usuario pelo nome do usuario(username) e não o nome completo literal
                        ? SlidableWidget(
                            child: TicketCard(
                              ticket: state.labsTickets[index],
                              onTap: () {},
                              onPressedLike: () {
                                BlocProvider.of<ListTicketBloc>(context)
                                    .add(ListTicketLiked(
                                  state.labsTickets[index],
                                ));
                              },
                              onPressedDislike: () {
                                BlocProvider.of<ListTicketBloc>(context)
                                    .add(ListTicketDisliked(
                                  state.labsTickets[index],
                                ));
                              },
                            ),
                            onDismissed: (action) =>
                                BlocProvider.of<ListTicketBloc>(context).add(
                                    LabTicketMenu(
                                        state.labsTickets[index], action)))
                        : TicketCard(
                            ticket: state.labsTickets[index],
                            onTap: () {},
                            onPressedLike: () {
                              BlocProvider.of<ListTicketBloc>(context)
                                  .add(ListTicketLiked(
                                state.labsTickets[index],
                              ));
                            },
                            onPressedDislike: () {
                              BlocProvider.of<ListTicketBloc>(context)
                                  .add(ListTicketDisliked(
                                state.labsTickets[index],
                              ));
                            },
                          );
                  })
              : ErrorMessageWidget(
                  message: "Houve um erro ao carregar a lista."),
    );
  });
}
