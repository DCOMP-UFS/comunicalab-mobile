import 'package:meta/meta.dart';
import 'package:comunica_mobile/models/ticket.dart';

@immutable
abstract class EquipmentTicketListState {
  const EquipmentTicketListState();
}

class EquipmentTicketListLoadSuccess extends EquipmentTicketListState {
  //Chamados
  final List<Ticket> userTickets;

  const EquipmentTicketListLoadSuccess({
    this.userTickets,
  });

  EquipmentTicketListLoadSuccess copyWith({
    final List<Ticket> userTickets,
  }) {
    return EquipmentTicketListLoadSuccess(
      userTickets: userTickets ?? this.userTickets,
    );
  }
}

class EquipmentTicketListLoadInProgress extends EquipmentTicketListState {}

class EquipmentTicketListLoadFailure extends EquipmentTicketListState {}
