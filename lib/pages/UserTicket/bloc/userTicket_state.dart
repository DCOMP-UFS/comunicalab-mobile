import 'package:meta/meta.dart';

@immutable
abstract class FilterUserTicketListState {
  const FilterUserTicketListState();
}

class NoFilter extends FilterUserTicketListState {}

class Filtered extends FilterUserTicketListState {}
