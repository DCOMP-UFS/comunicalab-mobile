import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/pages/Software/bloc/bloc.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/customBottomNavigationBar.dart';
import 'package:comunica_mobile/widgets/loadingWidget.dart';
import 'package:comunica_mobile/widgets/errorWidget.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/ticketCard.dart';

class SoftwareTicketList extends StatefulWidget {
  @override
  _SoftwareTicketListState createState() => _SoftwareTicketListState();
}

class _SoftwareTicketListState extends State<SoftwareTicketList> {
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
        ),
        drawer: handlerSideBar(context),
        body: SafeArea(
          child: state is SoftwareTicketListLoadInProgress
              ? LoadingWidget(message: "Carregando os chamados...")
              : state is SoftwareTicketListLoadSuccess
                  ? ListView.builder(
                      itemCount: state?.userTickets?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TicketCard(
                          ticket: state.userTickets[index],
                          onTap: () {},
                          onPressedLike: () {
                            BlocProvider.of<SoftwareTicketListBloc>(context)
                                .add(SoftwareTicketLiked(
                              state.userTickets[index],
                            ));
                          },
                          onPressedDislike: () {
                            BlocProvider.of<SoftwareTicketListBloc>(context)
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
