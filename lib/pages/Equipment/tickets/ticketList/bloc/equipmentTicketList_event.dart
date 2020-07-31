import 'package:meta/meta.dart';
import 'package:comunica_mobile/models/ticket.dart';

@immutable
abstract class EquipmentTicketListEvent {
  const EquipmentTicketListEvent();
}

class FetchEquipmentTickets extends EquipmentTicketListEvent {}

class EquipmentTicketLiked extends EquipmentTicketListEvent {
  final Ticket ticket;

  EquipmentTicketLiked(this.ticket);
}

class EquipmentTicketDisliked extends EquipmentTicketListEvent {
  final Ticket ticket;

  EquipmentTicketDisliked(this.ticket);
}
