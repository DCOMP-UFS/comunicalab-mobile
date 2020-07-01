import 'package:comunica_mobile/models/ticket.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserTicketListState {
  const UserTicketListState();
}

class UserTicketListLoadSuccess extends UserTicketListState {
  //Chamados
  final List<Ticket> userTickets;

  //Filtros
  final DateTime dateTime;
  final String troubleType;
  final String ticketStatus;

  const UserTicketListLoadSuccess({
    this.userTickets,
    this.dateTime,
    this.troubleType,
    this.ticketStatus,
  });

  UserTicketListLoadSuccess copyWith({
    final List<Ticket> userTickets,
    final DateTime dateTime,
    final String troubleType,
    final String ticketStatus,
  }) {
    return UserTicketListLoadSuccess(
      userTickets: userTickets ?? this.userTickets,
      dateTime: dateTime ?? this.dateTime,
      troubleType: troubleType ?? this.troubleType,
      ticketStatus: ticketStatus ?? this.ticketStatus,
    );
  }
}

class UserTicketListLoadInProgress extends UserTicketListState {}

class UserTicketListLoadFailure extends UserTicketListState {}
