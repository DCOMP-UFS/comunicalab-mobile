import 'package:meta/meta.dart';

@immutable
abstract class FilterUserTicketListEvent {
  const FilterUserTicketListEvent();
}

class SearchIconPressed extends FilterUserTicketListEvent {}

class BackIconPressed extends FilterUserTicketListEvent {}

class FilterBy extends FilterUserTicketListEvent {
  final String type;
  final String keyword;

  const FilterBy(this.type, {this.keyword = ""});
}

class AddFilterPin extends FilterUserTicketListEvent {
  final String keyword;

  const AddFilterPin(this.keyword);
}

class RemoveFilterPin extends FilterUserTicketListEvent {}
