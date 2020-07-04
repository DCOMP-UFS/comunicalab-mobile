import 'package:comunica_mobile/models/ticket.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserTicketListEvent {
  const UserTicketListEvent();
}

class FetchUserTickets extends UserTicketListEvent {}

class ApplyFilter extends UserTicketListEvent {
  //Futuramente, esses parâmetros podem ser substituídos pela model que trata a integração com a API
  final Map<String, dynamic> filter;

  const ApplyFilter(this.filter);
}

class UserTicketLiked extends UserTicketListEvent {
  final Ticket ticket;

  UserTicketLiked(this.ticket);
}

class UserTicketDisliked extends UserTicketListEvent {
  final Ticket ticket;

  UserTicketDisliked(this.ticket);
}
