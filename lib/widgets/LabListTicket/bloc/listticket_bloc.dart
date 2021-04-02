import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/api.dart';
import 'package:comunica_mobile/models/ticket.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/slidable_widget.dart';
import 'package:dio/dio.dart';
import './bloc.dart';

class ListTicketBloc extends Bloc<ListTicketEvent, ListTicketState> {
  @override
  ListTicketState get initialState => InitialListTicketState();

  @override
  Stream<ListTicketState> mapEventToState(ListTicketEvent event) async* {
    final currentState = state;

    try {
      if (event is ListTicketLoad) {
        yield ListTicketLoading();
        //Forma correta de receber os tickets do laboratorio  do servidor
        //final response = await getLabTickets(event.labId);
        //yield ListTicketSuccess(labs: List<Map>.from(response.data));

        final response = await _fetchCalls(); //Debug
        final List<Ticket> tickets = [];

        //TODO PARA CONVERTER TODOS OS DADOS RECEBIDOS EM UM TIPO TICKET (USAR NAS OUTRAS LISTAS DE CHAMADOS E LABORATORIO)
        for (int i = 0; i < response.length; i++) {
          tickets.add(Ticket.fromJson(response[i]));
        }

        yield ListTicketSuccess(labsTickets: tickets);
      } else if (event is ListTicketLiked) {
        if (currentState is ListTicketSuccess) {
          final List<Ticket> _updatedEquipmentTickets = currentState.labsTickets
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
      } else if (event is ListTicketDisliked) {
        if (currentState is ListTicketSuccess) {
          final List<Ticket> _updatedEquipmentTickets = currentState.labsTickets
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
      } else if (event is ApplyFilterLabTicket) {
        List<Ticket> _oldTickets;
        if (currentState is ListTicketSuccess) {
          _oldTickets = currentState.labsTickets;
        }
        yield ListTicketLoading();

        if (event.filter != null) {
          //final response = await getLabTickets(event.labId);
          final response = await _fetchCalls(); //Debug
          final List<Ticket> tickets = [];

          for (int i = 0; i < response.length; i++) {
            tickets.add(Ticket.fromJson(response[i]));
          }
          final filteredTickets = filterTickets(event?.filter, tickets);
          yield ListTicketSuccess(
              labsTickets: filteredTickets, filter: event?.filter);
        } else {
          yield ListTicketSuccess(labsTickets: _oldTickets);
        }
      } else if (event is LabTicketMenu) {
        if (currentState is ListTicketSuccess) {
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
    } catch (e) {
      yield ListTicketError(
          labsTickets:
              e); //Há necessidade de dizer que houve erro ao carregar o ticket x?
    }
  }
}

Future<List<Map>> _fetchCalls() async {
  final response = [
    {
      "id": 2,
      "requestingUser": "Java Martins",
      "category": "Laboratório",
      "type": "Tipo de Problema 2",
      "dateTime": DateTime.now().toString(),
      "status": "Pendente",
      "likes": 7,
      "dislikes": 147,
      "liked": 'N',
    },
    {
      "id": 4,
      "requestingUser": "Manolo da Silva",
      "category": "Laboratório",
      "type": "Tipo de Problema 3",
      "dateTime": DateTime.now().toString(),
      "status": "Pendente",
      "likes": 7,
      "dislikes": 147,
      "liked": 'N',
    },
    {
      "id": 3,
      "requestingUser": "Josue Virgolini",
      "category": "Laboratório",
      "type": "Tipo de Problema 2",
      "dateTime": DateTime.now().toString(),
      "status": "Finalizado",
      "likes": 7,
      "dislikes": 147,
      "liked": 'N',
    },
  ];

  await Future.delayed(Duration(seconds: 2)); //simula latência
  return response;
}
