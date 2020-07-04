import 'package:comunica_mobile/models/ticket.dart';
import 'package:comunica_mobile/pages/UserTicket/userTicket.dart';
import 'package:comunica_mobile/widgets/errorWidget.dart';
import 'package:comunica_mobile/widgets/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/pages/UserTicket/bloc/bloc.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/customBottomNavigationBar.dart';
import 'package:comunica_mobile/widgets/FilterWidgets/filterBottomSheet.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/ticketCard.dart';

class UserTicketList extends StatefulWidget {
  @override
  _UserTicketListState createState() => _UserTicketListState();
}

class _UserTicketListState extends State<UserTicketList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserTicketListBloc, UserTicketListState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Lista de Chamados'),
                IconButton(
                  icon: Icon(
                    Icons.filter_list,
                  ),
                  onPressed: state is! UserTicketListLoadSuccess
                      ? null
                      : () async {
                          if (state is UserTicketListLoadSuccess) {
                            filterBottomSheet(
                              context: context,
                              dateTime: state?.filter['dateTime'],
                              troubleType: state?.filter['troubleType'],
                              ticketStatus: state?.filter['ticketStatus'],
                            ).then((filter) {
                              BlocProvider.of<UserTicketListBloc>(context)
                                  .add(ApplyFilter(filter));
                            });
                          }
                        },
                ),
              ],
            ),
          ),
          drawer: handlerSideBar(context),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: state is UserTicketListLoadInProgress
                ? LoadingWidget(message: "Carregando os chamados...")
                : state is UserTicketListLoadSuccess
                    ? ListView.builder(
                        itemCount: state?.userTickets?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TicketCard(
                            ticket: state.userTickets[index],
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return UserTicket();
                                }),
                              );
                            },
                            onPressedLike: () {
                              BlocProvider.of<UserTicketListBloc>(context)
                                  .add(UserTicketLiked(
                                state.userTickets[index],
                              ));
                            },
                            onPressedDislike: () {
                              BlocProvider.of<UserTicketListBloc>(context)
                                  .add(UserTicketDisliked(
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
      },
    );
  }
}
