import 'package:meta/meta.dart';
import 'package:comunica_mobile/models/ticket.dart';

@immutable
abstract class EquipmentTicketListState {
  const EquipmentTicketListState();
}

class EquipmentTicketListLoadSuccess extends EquipmentTicketListState {
  //Chamados
  final List<Ticket> userTickets;

  //Filtro
  final Map<String, dynamic> filter;

  const EquipmentTicketListLoadSuccess({
    this.userTickets,
    this.filter = const <String, dynamic>{
      "dateTime": null,
      "troubleType": null,
      "ticketStatus": null,
    },
  });

  EquipmentTicketListLoadSuccess copyWith({
    final List<Ticket> userTickets,
    final Map<String, dynamic> filter,
  }) {
    return EquipmentTicketListLoadSuccess(
      userTickets: userTickets ?? this.userTickets,
      filter: filter ?? this.filter,
    );
  }
}

class EquipmentTicketListLoadInProgress extends EquipmentTicketListState {}

class EquipmentTicketListLoadFailure extends EquipmentTicketListState {}
