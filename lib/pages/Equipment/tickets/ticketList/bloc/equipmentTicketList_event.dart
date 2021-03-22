import 'package:comunica_mobile/widgets/TicketWidgets/slidable_widget.dart';
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

class ApplyFilterEquipment extends EquipmentTicketListEvent {
  //Futuramente esses parametros podem ser substituídos pela model que trata a integração com a API
  final Map<String, dynamic> filter;

  const ApplyFilterEquipment(this.filter);
}

class EquipmentTicketMenu extends EquipmentTicketListEvent {
  final Ticket ticket;
  final SlidableAction action;

  EquipmentTicketMenu(this.ticket, this.action);
}
