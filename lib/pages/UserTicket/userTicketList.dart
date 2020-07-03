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

class _UserTicketListState extends State<UserTicketList>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

//  MaterialColor customPrimarySwatch = MaterialColor(0xFF000080, <int, Color>{
//    50: Color(0xFFEAE3F3),
//    100: Color(0xFFC9BBE2),
//    200: Color(0xFFa68fcf),
//    300: Color(0xFF8262bc),
//    400: Color(0xFF6841af),
//    500: Color(0xFF4c1fa2),
//    600: Color(0xFF431b9d),
//    700: Color(0xFF351394),
//    800: Color(0xFF260d8d),
//    900: Color(0xFF000080),
//  });

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
                              dateTime: state?.dateTime,
                              troubleType: state?.troubleType,
                              ticketStatus: state?.ticketStatus,
                            ).then((filter) {
                              BlocProvider.of<UserTicketListBloc>(context)
                                  .add(ApplyFilter(
                                filter['dateTime'],
                                filter['troubleType'],
                                filter['ticketStatus'],
                              ));
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
                              BlocProvider.of<UserTicketListBloc>(context).add(
                                  UserTicketLiked(state.userTickets[index]));
                            },
                            onPressedDislike: () {
                              BlocProvider.of<UserTicketListBloc>(context).add(
                                  UserTicketDisliked(state.userTickets[index]));
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
