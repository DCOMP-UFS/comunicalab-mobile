import 'package:comunica_mobile/pages/Ticket/ticketList/bloc/bloc.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/customBottomNavigationBar.dart';
import 'package:comunica_mobile/widgets/loadingWidget.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/ticketCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/ticketList_bloc.dart';

class TicketList extends StatefulWidget {
  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Lista de Chamados",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            Container(
              padding: EdgeInsets.all(3.0),
              child: Text(
                "Equipamento 1",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      drawer: handlerSideBar(context),
      body: BlocBuilder<TicketListBloc, TicketListState>(
          builder: (context, state) {
        if (state is TicketListLoadInProgress) {
          return LoadingWidget(message: "Carregando os chamados...");
        }
        if (state is TicketListLoadFailure) {
          return Center(
            child: Text("Ocorreu um erro."),
          );
        }
        return ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return TicketCard(
              title: "Fulano da Silva Santos",
              lab: "Hardware",
              status: "Pendente",
              dateTime: DateTime.now(),
              like: BlocProvider.of<TicketListBloc>(context).like,
              likesNumber: BlocProvider.of<TicketListBloc>(context).likes,
              dislikesNumber: BlocProvider.of<TicketListBloc>(context).dislikes,
              onPressedLike: () {
                BlocProvider.of<TicketListBloc>(context).add(TicketLiked());
              },
              onPressedDislike: () {
                BlocProvider.of<TicketListBloc>(context).add(TicketDisliked());
              },
            );
          },
        );
      }),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
