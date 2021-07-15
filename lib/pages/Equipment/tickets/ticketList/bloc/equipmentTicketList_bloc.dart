import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/slidable_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/models/ticket.dart';
import 'package:comunica_mobile/pages/Equipment/tickets/ticketList/bloc/equipmentTicketList_event.dart';
import 'package:comunica_mobile/pages/Equipment/tickets/ticketList/bloc/equipmentTicketList_state.dart';

class EquipmentTicketListBloc
    extends Bloc<EquipmentTicketListEvent, EquipmentTicketListState> {
  @override
  get initialState => EquipmentTicketListLoadInProgress();

  @override
  Stream<EquipmentTicketListState> mapEventToState(event) async* {
    final currentState = state;
    try {
      if (event is FetchEquipmentTickets) {
        if (currentState is EquipmentTicketListLoadInProgress) {
          final tickets = await _fetchEquipmentTickets();
          yield EquipmentTicketListLoadSuccess(userTickets: tickets);
        }
      } else if (event is ApplyFilterEquipment) {
        List<Ticket> _oldTickets;
        if (currentState is EquipmentTicketListLoadSuccess) {
          _oldTickets = currentState.userTickets;
        }
        yield EquipmentTicketListLoadInProgress();

        if (event.filter != null) {
          final filteredTickets =
              filterTickets(event?.filter, await _fetchEquipmentTickets());
          yield EquipmentTicketListLoadSuccess(
              userTickets: filteredTickets, filter: event?.filter);
        } else {
          yield EquipmentTicketListLoadSuccess(userTickets: _oldTickets);
        }
      } else if (event is EquipmentTicketLiked) {
        if (currentState is EquipmentTicketListLoadSuccess) {
          final List<Ticket> _updatedEquipmentTickets = currentState.userTickets
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
          yield currentState.copyWith(userTickets: _updatedEquipmentTickets);
        }
      } else if (event is EquipmentTicketDisliked) {
        if (currentState is EquipmentTicketListLoadSuccess) {
          final List<Ticket> _updatedEquipmentTickets = currentState.userTickets
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
          yield currentState.copyWith(userTickets: _updatedEquipmentTickets);
        }
      } else if (event is EquipmentTicketMenu) {
        if (currentState is EquipmentTicketListLoadSuccess) {
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
      yield EquipmentTicketListLoadFailure();
    }
  }

  Future<List<Ticket>> _fetchEquipmentTickets() async {
    //Simula a resposta do servidor.
    final response = <Ticket>[
      Ticket(
        id: 1,
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
        id: 5,
        requestingUser: "Fulano da Silva Santos",
        category: "Equipamento",
        type: "Tipo de Problema 2",
        dateTime: DateTime.now(),
        status: "Andamento",
        likes: 230,
        dislikes: 4,
        liked: 'N',
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
    ].where((element) => element.category == 'Equipamento').toList();

    response.sort(); //Ordena os chamados de acordo com o seu status;
    await Future.delayed(Duration(seconds: 3)); //simula latência
    return response;
  }
}
