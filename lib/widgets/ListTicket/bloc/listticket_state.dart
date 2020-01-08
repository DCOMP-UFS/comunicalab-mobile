import 'package:meta/meta.dart';

@immutable
abstract class ListTicketState {
  final List<Map> labs = List<Map>();
}
  
class InitialListTicketState extends ListTicketState {
  final List<Map> labs = List<Map>();
}

class ListTicketLoading extends ListTicketState {
}

class ListTicketSuccess extends ListTicketState {
  final List<Map> labs;
  ListTicketSuccess({
    @required this.labs,
  });
}

class ListTicketError extends ListTicketState {
  final List<Map> labs;
  ListTicketError({
    @required this.labs,
  });
}
