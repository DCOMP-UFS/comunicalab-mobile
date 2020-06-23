import 'package:meta/meta.dart';

@immutable
abstract class UserTicketListEvent {
  const UserTicketListEvent();
}

class FetchUserTickets extends UserTicketListEvent {}

class ApplyFilter extends UserTicketListEvent {
  //Futuramente, esses parâmetros podem ser substituídos pela model que trata a integração com a API
  final DateTime dateTime;
  final String troubleType;
  final String ticketStatus;

  const ApplyFilter(this.dateTime, this.troubleType, this.ticketStatus);
}

class CleanFilter extends UserTicketListEvent {}

class UserTicketLiked extends UserTicketListEvent {}

class UserTicketDisliked extends UserTicketListEvent {}
