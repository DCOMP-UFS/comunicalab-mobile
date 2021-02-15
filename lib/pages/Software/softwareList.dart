import 'package:comunica_mobile/widgets/TicketWidgets/slidable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/pages/Software/bloc/bloc.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/customBottomNavigationBar.dart';
import 'package:comunica_mobile/widgets/loadingWidget.dart';
import 'package:comunica_mobile/widgets/errorWidget.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/ticketCard.dart';
import 'package:comunica_mobile/models/user.dart';
import 'package:comunica_mobile/widgets/FilterWidgets/filterBottomSheet.dart';

class SoftwareTicketList extends StatefulWidget {
  @override
  _SoftwareTicketListState createState() => _SoftwareTicketListState();
}

class _SoftwareTicketListState extends State<SoftwareTicketList> {
  User _user = new User(); // PARA DEBUG, SIMULANDO O USUARIO LOGADO

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SoftwareTicketListBloc, SoftwareTicketListState>(
        builder: (context, state) {
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
                  "Software 1",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              onPressed: state is! SoftwareTicketListLoadSuccess
                  ? null
                  : () async {
                      if (state is SoftwareTicketListLoadSuccess) {
                        filterBottomSheet(
                                context: context,
                                dateTime: state.filter["dateTime"],
                                ticketStatus: state.filter["ticketStatus"],
                                troubleType: state.filter["troubleType"])
                            .then((filter) {
                          BlocProvider.of<SoftwareTicketListBloc>(context)
                              .add(ApplyFilterSoftware(filter));
                        });
                      }
                    },
              icon: Icon(Icons.filter_list),
              color: Colors.white,
            )
          ],
        ),
        drawer: handlerSideBar(context),
        body: SafeArea(
          child: state is SoftwareTicketListLoadInProgress
              ? LoadingWidget(message: "Carregando os chamados...")
              : state is SoftwareTicketListLoadSuccess
                  ? ListView.builder(
                      itemCount: state?.userTickets?.length,
                      itemBuilder: (BuildContext context, int index) {
                        //retorne o menu slidable se for o dono do ticket e se tambem for pedente
                        return _user.getUser ==
                                    state.userTickets[index].requestingUser &&
                                state.userTickets[index].status ==
                                    'Pendente' //TODO: checar o usuario pelo nome do usuario(username) e não o nome completo literal
                            ? SlidableWidget(
                                onDismissed: (action) => BlocProvider.of<
                                        SoftwareTicketListBloc>(context)
                                    .add(SoftwareTicketMenu(
                                        state.userTickets[index],
                                        action)), //_dismissSlidableItem(context, index, action),
                                child: TicketCard(
                                  ticket: state.userTickets[index],
                                  onTap: () {},
                                  onPressedLike: () {
                                    BlocProvider.of<SoftwareTicketListBloc>(
                                            context)
                                        .add(SoftwareTicketLiked(
                                      state.userTickets[index],
                                    ));
                                  },
                                  onPressedDislike: () {
                                    BlocProvider.of<SoftwareTicketListBloc>(
                                            context)
                                        .add(SoftwareTicketDisliked(
                                      state.userTickets[index],
                                    ));
                                  },
                                ),
                              )
                            : TicketCard(
                                ticket: state.userTickets[index],
                                onTap: () {},
                                onPressedLike: () {
                                  BlocProvider.of<SoftwareTicketListBloc>(
                                          context)
                                      .add(SoftwareTicketLiked(
                                    state.userTickets[index],
                                  ));
                                },
                                onPressedDislike: () {
                                  BlocProvider.of<SoftwareTicketListBloc>(
                                          context)
                                      .add(SoftwareTicketDisliked(
                                    state.userTickets[index],
                                  ));
                                },
                              );
                      },
                    )
                  : ErrorMessageWidget(
                      message: "Houve um erro ao carregar a lista."),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      );
    });
  }
}
