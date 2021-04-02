import 'package:comunica_mobile/models/ticket.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/slidable_widget.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListTicketEvent {
  final int labId = 0;

  const ListTicketEvent();
}

class ListTicketLoad extends ListTicketEvent {
  final int labId;
  ListTicketLoad({
    @required this.labId,
  });
}

class ListTicketInit extends ListTicketEvent {
  final int labId = 0;
}

class ListTicketLiked extends ListTicketEvent {
  final Ticket ticket;

  ListTicketLiked(this.ticket);
}

class ListTicketDisliked extends ListTicketEvent {
  final Ticket ticket;

  ListTicketDisliked(this.ticket);
}

class ApplyFilterLabTicket extends ListTicketEvent {
  //Futuramente esses parametros podem ser substituídos pela model que trata a integração com a API
  final Map<String, dynamic> filter;

  const ApplyFilterLabTicket(this.filter);
}

class LabTicketMenu extends ListTicketEvent {
  final Ticket ticket;
  final SlidableAction action;

  LabTicketMenu(this.ticket, this.action);
}
