import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/models/ticket.dart';
import 'package:comunica_mobile/pages/Software/bloc/softwareList_event.dart';
import 'package:comunica_mobile/pages/Software/bloc/softwareList_state.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/slidable_widget.dart';

class SoftwareTicketListBloc
    extends Bloc<SoftwareTicketListEvent, SoftwareTicketListState> {
  @override
  get initialState => SoftwareTicketListLoadInProgress();

  @override
  Stream<SoftwareTicketListState> mapEventToState(event) async* {
    final currentState = state;

    try {
      if (event is FetchSoftwareTickets) {
        if (currentState is SoftwareTicketListLoadInProgress) {
          final tickets = await _fetchSoftwareTickets();

          yield SoftwareTicketListLoadSuccess(
            userTickets: tickets,
          );
        }
      } else if (event is ApplyFilterSoftware) {
        yield SoftwareTicketListLoadInProgress();
        //TODO: Tratar o date time como receberia no json para poder usá-lo no filtro corretamente (usar parse?ver filtro do lab (feature 91))
        //print(event.filter);
        if (event.filter != null) {
          final filteredTickets =
              _filterTickets(event?.filter, await _fetchSoftwareTickets());
          yield SoftwareTicketListLoadSuccess(
              userTickets: filteredTickets, filter: event?.filter);
        } else {
          yield SoftwareTicketListLoadSuccess(
              userTickets: await _fetchSoftwareTickets());
        }
      } else if (event is SoftwareTicketLiked) {
        if (currentState is SoftwareTicketListLoadSuccess) {
          final List<Ticket> _updatedSoftwareTickets = currentState.userTickets
              .map((ticket) => ticket.id == event.ticket.id
                  ? ticket.copyWith(
                      liked: ticket.liked == 'S' ? '' : 'S',
                      likes: ticket.liked == 'S'
                          ? ticket.likes - 1
                          : ticket.likes + 1,
                      dislikes: ticket.liked == 'N'
                          ? ticket.dislikes - 1
                          : ticket.dislikes,
                    )
                  : ticket)
              .toList();
          yield currentState.copyWith(userTickets: _updatedSoftwareTickets);
        }
      } else if (event is SoftwareTicketDisliked) {
        if (currentState is SoftwareTicketListLoadSuccess) {
          final List<Ticket> _updatedSoftwareTickets = currentState.userTickets
              .map((ticket) => ticket.id == event.ticket.id
                  ? ticket.copyWith(
                      liked: ticket.liked == 'N' ? '' : 'N',
                      likes:
                          ticket.liked == 'S' ? ticket.likes - 1 : ticket.likes,
                      dislikes: ticket.liked == 'N'
                          ? ticket.dislikes - 1
                          : ticket.dislikes + 1,
                    )
                  : ticket)
              .toList();
          yield currentState.copyWith(userTickets: _updatedSoftwareTickets);
        }
      } else if (event is SoftwareTicketMenu) {
        if (currentState is SoftwareTicketListLoadSuccess) {
          //TODO: Inserir aqui as ações do menu do ticket
          switch (event.action) {
            case SlidableAction.edit:
              print("Botao Edit clicado.");
              break;

            case SlidableAction.delete:
              print("Botao Delete clicado.");
              //Colocar um Alert Dialog aqui antes de executar o comando
              //deleteSoftwareTicket();
              break;
          }
        }
      }
    } catch (_) {
      yield SoftwareTicketListLoadFailure();
    }
  }

  //Deve existir alguma forma mais eficiente e bonita de se fazer isso.
  List<Ticket> _filterTickets(
      Map<String, dynamic> filter, List<Ticket> tickets) {
    List<Ticket> _filteredTickets;

    //sem filtro
    if (filter["ticketStatus"] == null &&
        filter["dateTime"] == null &&
        filter["troubleType"] == null) {
      _filteredTickets = tickets;
      //Só Status do Ticket
    } else if (filter["ticketStatus"] != null &&
        filter["dateTime"] == null &&
        filter["troubleType"] == null) {
      _filteredTickets = tickets
          .where((element) => element.status == filter["ticketStatus"])
          .toList();
      //Só Data
    } else if (filter["ticketStatus"] == null &&
        filter["dateTime"] != null &&
        filter["troubleType"] == null) {
      _filteredTickets = tickets
          .where((element) => element.dateTime == filter["dateTime"])
          .toList();
      //Só tipo de problema
    } else if (filter["ticketStatus"] == null &&
        filter["dateTime"] == null &&
        filter["troubleType"] != null) {
      _filteredTickets = tickets
          .where((element) => element.type == filter["troubleType"])
          .toList();
      //Só o status e data
    } else if (filter["ticketStatus"] != null &&
        filter["dateTime"] != null &&
        filter["troubleType"] == null) {
      _filteredTickets = tickets
          .where((element) =>
              element.status == filter["ticketStatus"] &&
              element.dateTime == filter["dateTime"])
          .toList();
      //Só a data e o tipo
    } else if (filter["ticketStatus"] == null &&
        filter["dateTime"] != null &&
        filter["troubleType"] != null) {
      _filteredTickets = tickets
          .where((element) =>
              element.type == filter["troubleType"] &&
              element.dateTime == filter["dateTime"])
          .toList();
      //So o status e o tipo
    } else if (filter["ticketStatus"] != null &&
        filter["dateTime"] == null &&
        filter["troubleType"] != null) {
      _filteredTickets = tickets
          .where((element) =>
              element.status == filter["ticketStatus"] &&
              element.type == filter["troubleType"])
          .toList();
    }

    return _filteredTickets;
  }

  Future<List<Ticket>> _fetchSoftwareTickets() async {
    //Simula a resposta do servidor.
    final response = <Ticket>[
      Ticket(
        id: 1,
        title: "Teclado Quebrado",
        requestingUser: "Fulano da Silva Santos",
        category: "Equipamento",
        type: "Tipo de Problema 1",
        dateTime: DateTime.now(),
        status: "Pendente",
        likes: 200,
        dislikes: 30,
        liked: 'S',
      ),
      Ticket(
        id: 2,
        requestingUser: "Cicrano de Souza",
        category: "Laboratório",
        type: "Tipo de Problema 2",
        dateTime: DateTime.now(),
        status: "Finalizado",
        likes: 7,
        dislikes: 147,
        liked: 'N',
      ),
      Ticket(
        id: 3,
        requestingUser: "Beltrano de Santana",
        category: "Software",
        type: "Tipo de Problema 3",
        dateTime: DateTime.now(),
        status: "Andamento",
        likes: 140,
        dislikes: 25,
        liked: 'S',
      ),
      Ticket(
        id: 4,
        requestingUser: "Java Martins",
        category: "Software",
        type: "Tipo de Problema 4",
        dateTime: DateTime.now(),
        status: "Pendente",
        likes: 396,
        dislikes: 1204,
        liked: 'N',
      ),
      Ticket(
        id: 8,
        requestingUser: "Java Martins",
        category: "Software",
        type: "Tipo de Problema 3",
        dateTime: DateTime.now(),
        status: "Andamento",
        likes: 231,
        dislikes: 550,
        liked: 'N',
      ),
      Ticket(
        id: 5,
        requestingUser: "Jose Santos",
        category: "Software",
        type: "Tipo de Problema 4",
        dateTime: DateTime.now(),
        status: "Pendente",
        likes: 396,
        dislikes: 1204,
        liked: 'N',
      ),
      Ticket(
        id: 6,
        requestingUser: "Karlson Ruas",
        category: "Software",
        type: "Tipo de Problema 4",
        dateTime: DateTime.now(),
        status: "Pendente",
        likes: 396,
        dislikes: 1204,
        liked: 'N',
      ),
      Ticket(
        id: 7,
        requestingUser: "Gilberto Barros",
        category: "Software",
        type: "Tipo de Problema 1",
        dateTime: DateTime.now(),
        status: "Pendente",
        likes: 396,
        dislikes: 1204,
        liked: 'N',
      ),
    ].where((element) => element.category == 'Software').toList();

    response.sort(); //Ordena os chamados de acordo com o seu status;
    await Future.delayed(Duration(seconds: 2)); //simula latência
    return response;
  }
}
