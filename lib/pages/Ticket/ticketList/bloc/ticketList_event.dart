import 'package:meta/meta.dart';

@immutable
abstract class TicketListEvent {
  const TicketListEvent();
}

class TicketListFetch extends TicketListEvent {}

class TicketLiked extends TicketListEvent {}

class TicketDisliked extends TicketListEvent {}
