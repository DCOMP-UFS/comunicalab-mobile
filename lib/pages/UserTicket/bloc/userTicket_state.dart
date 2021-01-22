import 'package:comunica_mobile/models/ticket.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserTicketState {
  const UserTicketState();
}

class UserTicketLoading extends UserTicketState {}

class UserTicketSuccess extends UserTicketState {
  final Ticket ticket;

  const UserTicketSuccess({@required this.ticket});

  UserTicketSuccess copyWith({
    final Ticket ticket,
  }) {
    return UserTicketSuccess(
      ticket: ticket ?? this.ticket,
    );
  }
}

class UserTicketError extends UserTicketState {}
