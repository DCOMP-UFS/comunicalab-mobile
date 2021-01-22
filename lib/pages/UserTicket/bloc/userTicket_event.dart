import 'package:comunica_mobile/models/ticket.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserTicketEvent {
  const UserTicketEvent();
}

class GetUserTicketEvent extends UserTicketEvent {
  final Ticket ticket;

  const GetUserTicketEvent({@required this.ticket});
}
