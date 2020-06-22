import 'package:meta/meta.dart';

@immutable
abstract class FilterUserTicketListEvent {
  const FilterUserTicketListEvent();
}

class ApplyFilter extends FilterUserTicketListEvent {}

class CleanFilter extends FilterUserTicketListEvent {}
