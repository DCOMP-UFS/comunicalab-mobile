import 'package:meta/meta.dart';

@immutable
abstract class UserTicketListState {
  const UserTicketListState();
}

class UserTicketListLoadSuccess extends UserTicketListState {
  //Futuramente, esses parâmetros podem ser substituídos pela model que trata a integração com a API
  final DateTime dateTime;
  final String troubleType;
  final String ticketStatus;

  const UserTicketListLoadSuccess({
    this.dateTime,
    this.troubleType,
    this.ticketStatus,
  });

  UserTicketListLoadSuccess copyWith({
    final DateTime dateTime,
    final String troubleType,
    final String ticketStatus,
  }) {
    return UserTicketListLoadSuccess(
      dateTime: dateTime ?? this.dateTime,
      troubleType: troubleType ?? this.troubleType,
      ticketStatus: ticketStatus ?? this.ticketStatus,
    );
  }
}

class UserTicketListLoadInProgress extends UserTicketListState {}

class UserTicketListLoadFailure extends UserTicketListState {}
