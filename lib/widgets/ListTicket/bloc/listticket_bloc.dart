import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/api.dart';
import 'package:dio/dio.dart';
import './bloc.dart';

class ListTicketBloc extends Bloc<ListTicketEvent, ListTicketState> {
  @override
  ListTicketState get initialState => InitialListTicketState();

  @override
  Stream<ListTicketState> mapEventToState(
    ListTicketEvent event,
  ) async* {
    if (event is ListTicketLoad) {
      yield ListTicketLoading();
      try {
        Response response = await getLabTickets(event.labId);
        yield ListTicketSuccess(labs: List<Map>.from(response.data));
        // List<Map> response = [
        //   {
        //     "id": 10,
        //     "title": "Teclado quebrado",
        //     "opened_at": DateTime.now(),
        //     "closed_at": DateTime.now(),
        //     "last_progress": {
        //       "id": 1,
        //       "description": "Chamado aberto",
        //       "progressed_at": DateTime.now(),
        //       "ticket_id": 10,
        //       "user_id": 1,
        //       "status": "Pendente"
        //     }
        //   },
        //   {
        //     "id": 11,
        //     "title": "Mouse quebrado",
        //     "opened_at": DateTime.now(),
        //     "closed_at": DateTime.now(),
        //     "last_progress": {
        //       "id": 1,
        //       "description": "Chamado aberto",
        //       "progressed_at": DateTime.now(),
        //       "ticket_id": 11,
        //       "user_id": 1,
        //       "status": "Andamento"
        //     }
        //   },
        //   {
        //     "id": 12,
        //     "title": "Monitor quebrado",
        //     "opened_at": DateTime.now(),
        //     "closed_at": DateTime.now(),
        //     "last_progress": {
        //       "id": 1,
        //       "description": "Chamado aberto",
        //       "progressed_at": DateTime.now(),
        //       "ticket_id": 12,
        //       "user_id": 1,
        //       "status": "Finalizado"
        //     }
        //   }
        // ];
      } catch (e) {
        yield ListTicketError(labs: e);
      }
    } else {
    }
  }
}
