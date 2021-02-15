import 'package:meta/meta.dart';
import 'package:comunica_mobile/models/ticket.dart';

@immutable
abstract class SoftwareTicketListState {
  const SoftwareTicketListState();
}

class SoftwareTicketListLoadSuccess extends SoftwareTicketListState {
  //Chamados
  final List<Ticket> userTickets;

  //Filtro
  final Map<String, dynamic> filter;

  const SoftwareTicketListLoadSuccess({
    this.userTickets,
    this.filter = const <String, dynamic>{
      "dateTime": null,
      "troubleType": null,
      "ticketStatus": null,
    }, //Inicializar o Map quando não há filtro
  });

  SoftwareTicketListLoadSuccess copyWith({
    final List<Ticket> userTickets,
    final Map<String, dynamic> filter,
  }) {
    return SoftwareTicketListLoadSuccess(
      userTickets: userTickets ?? this.userTickets,
      filter: filter ?? this.filter,
    );
  }
}

class SoftwareTicketListLoadInProgress extends SoftwareTicketListState {}

class SoftwareTicketListLoadFailure extends SoftwareTicketListState {}
