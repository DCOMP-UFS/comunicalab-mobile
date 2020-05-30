import 'package:meta/meta.dart';

@immutable
abstract class TicketListState {
  const TicketListState();
}

class TicketListLoadSuccess extends TicketListState {
  final List<Map>
      tickets; //Eventualmente, substituir Map por uma model baseada em como a API retorna esse dado.
  final int likes;
  final int dislikes;

  const TicketListLoadSuccess({this.tickets, this.likes, this.dislikes});
}

class TicketListLoadInProgress extends TicketListState {}

class TicketListLoadFailure extends TicketListState {}

class TicketLikeAdded extends TicketListState {}

class TicketDislikeAdded extends TicketListState {}
