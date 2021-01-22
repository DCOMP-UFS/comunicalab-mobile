import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class UserTicketBloc extends Bloc<UserTicketEvent, UserTicketState> {
  @override
  UserTicketState get initialState => UserTicketLoading();
  @override
  Stream<UserTicketState> mapEventToState(
    UserTicketEvent event,
  ) async* {
    try {
      final currentState = state;
      if (event is GetUserTicketEvent) {
        if (currentState is UserTicketLoading) {
          final ticket = event.ticket;
          yield UserTicketSuccess(ticket: ticket);
        }
      }
    } catch (_) {
      yield UserTicketError();
    }
  }
}

//TODO Precisa de Dispose?
