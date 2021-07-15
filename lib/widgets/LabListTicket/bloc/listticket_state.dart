import 'package:comunica_mobile/models/ticket.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ListTicketState {
  //final List<Map> labs = List<Map>();
}

class InitialListTicketState extends ListTicketState {
  final List<Ticket> labsTickets = List<Ticket>();
}

class ListTicketLoading extends ListTicketState {}

class ListTicketSuccess extends ListTicketState {
  final List<Ticket> labsTickets;

  //Filtro
  final Map<String, dynamic> filter;
  ListTicketSuccess(
      {@required this.labsTickets,
      this.filter = const <String, dynamic>{
        "dateTime": null,
        "troubleType": null,
        "ticketStatus": null,
      }});

  ListTicketSuccess copyWith({
    final List<Ticket> userTickets,
    final Map<String, dynamic> filter,
  }) {
    return ListTicketSuccess(
      labsTickets: userTickets ?? this.labsTickets,
      filter: filter ?? this.filter,
    );
  }
}

class ListTicketError extends ListTicketState {
  final List<Ticket> labsTickets;
  ListTicketError({
    @required this.labsTickets,
  });
}
