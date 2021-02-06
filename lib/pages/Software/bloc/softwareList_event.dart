import 'package:comunica_mobile/widgets/TicketWidgets/slidable_widget.dart';
import 'package:meta/meta.dart';
import 'package:comunica_mobile/models/ticket.dart';

@immutable
abstract class SoftwareTicketListEvent {
  const SoftwareTicketListEvent();
}

class FetchSoftwareTickets extends SoftwareTicketListEvent {}

class SoftwareTicketLiked extends SoftwareTicketListEvent {
  final Ticket ticket;

  SoftwareTicketLiked(this.ticket);
}

class SoftwareTicketDisliked extends SoftwareTicketListEvent {
  final Ticket ticket;

  SoftwareTicketDisliked(this.ticket);
}

class SoftwareTicketMenu extends SoftwareTicketListEvent {
  final Ticket ticket;
  final SlidableAction action;

  SoftwareTicketMenu(this.ticket, this.action);
}
