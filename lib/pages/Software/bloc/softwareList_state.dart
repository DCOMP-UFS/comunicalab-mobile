import 'package:meta/meta.dart';
import 'package:comunica_mobile/models/ticket.dart';

@immutable
abstract class SoftwareTicketListState {
  const SoftwareTicketListState();
}

class SoftwareTicketListLoadSuccess extends SoftwareTicketListState {
  //Chamados
  final List<Ticket> userTickets;

  const SoftwareTicketListLoadSuccess({
    this.userTickets,
  });

  SoftwareTicketListLoadSuccess copyWith({
    final List<Ticket> userTickets,
  }) {
    return SoftwareTicketListLoadSuccess(
      userTickets: userTickets ?? this.userTickets,
    );
  }
}

class SoftwareTicketListLoadInProgress extends SoftwareTicketListState {}

class SoftwareTicketListLoadFailure extends SoftwareTicketListState {}
