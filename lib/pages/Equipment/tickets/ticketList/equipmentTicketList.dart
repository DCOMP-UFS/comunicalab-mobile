import 'package:comunica_mobile/models/user.dart';
import 'package:comunica_mobile/widgets/FilterWidgets/filterBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/pages/Equipment/tickets/ticketList/bloc/bloc.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/customBottomNavigationBar.dart';
import 'package:comunica_mobile/widgets/loadingWidget.dart';
import 'package:comunica_mobile/widgets/errorWidget.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/slidable_widget.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/ticketCard.dart';

class TicketList extends StatefulWidget {
  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  User _user = new User();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EquipmentTicketListBloc, EquipmentTicketListState>(
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
                    "Equipamento 1",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                onPressed: state is! EquipmentTicketListLoadSuccess
                    ? null
                    : () async {
                        if (state is EquipmentTicketListLoadSuccess) {
                          filterBottomSheet(
                                  context: context,
                                  dateTime: state.filter["dateTime"],
                                  ticketStatus: state.filter["ticketStatus"],
                                  troubleType: state.filter["troubleType"])
                              .then((filter) {
                            BlocProvider.of<EquipmentTicketListBloc>(context)
                                .add(ApplyFilterEquipment(filter));
                          });
                        }
                      },
                icon: Icon(Icons.filter_list),
                color: Colors.white,
              ),
            ]),
        drawer: handlerSideBar(context),
        body: SafeArea(
          child: state is EquipmentTicketListLoadInProgress
              ? LoadingWidget(message: "Carregando os chamados...")
              : state is EquipmentTicketListLoadSuccess
                  ? ListView.builder(
                      itemCount: state?.userTickets?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _user.getUser ==
                                    state.userTickets[index].requestingUser &&
                                state.userTickets[index].status ==
                                    'Pendente' //TODO: checar o usuario pelo nome do usuario(username) e não o nome completo literal
                            ? SlidableWidget(
                                onDismissed: (action) => BlocProvider.of<
                                        EquipmentTicketListBloc>(context)
                                    .add(EquipmentTicketMenu(
                                        state.userTickets[index],
                                        action)), //_dismissSlidableItem(context, index, action),
                                child: TicketCard(
                                  ticket: state.userTickets[index],
                                  onTap: () {},
                                  onPressedLike: () {
                                    BlocProvider.of<EquipmentTicketListBloc>(
                                            context)
                                        .add(EquipmentTicketLiked(
                                      state.userTickets[index],
                                    ));
                                  },
                                  onPressedDislike: () {
                                    BlocProvider.of<EquipmentTicketListBloc>(
                                            context)
                                        .add(EquipmentTicketDisliked(
                                      state.userTickets[index],
                                    ));
                                  },
                                ),
                              )
                            : TicketCard(
                                ticket: state.userTickets[index],
                                onTap: () {},
                                onPressedLike: () {
                                  BlocProvider.of<EquipmentTicketListBloc>(
                                          context)
                                      .add(EquipmentTicketLiked(
                                    state.userTickets[index],
                                  ));
                                },
                                onPressedDislike: () {
                                  BlocProvider.of<EquipmentTicketListBloc>(
                                          context)
                                      .add(EquipmentTicketDisliked(
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
