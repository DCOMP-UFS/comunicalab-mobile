import 'package:comunica_mobile/models/ticket.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserTicketListState {
  const UserTicketListState();
}

class UserTicketListLoadSuccess extends UserTicketListState {
  //Chamados
  final List<Ticket> userTickets;

  //Filtro
  final Map<String, dynamic> filter;

  const UserTicketListLoadSuccess({
    this.userTickets,
    this.filter = const <String, dynamic>{
      "dateTime": null,
      "troubleType": null,
      "ticketStatus": null,
    }, //inicializa o Map caso não haja filtro
  });

  UserTicketListLoadSuccess copyWith({
    final List<Ticket> userTickets,
    final Map<String, dynamic> filter,
  }) {
    return UserTicketListLoadSuccess(
      userTickets: userTickets ?? this.userTickets,
      filter: filter ?? this.filter,
    );
  }
}

class UserTicketListLoadInProgress extends UserTicketListState {}

class UserTicketListLoadFailure extends UserTicketListState {}
