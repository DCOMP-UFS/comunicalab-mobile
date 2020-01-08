import 'package:meta/meta.dart';

@immutable
abstract class ListTicketEvent {
  final int labId = 0;
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