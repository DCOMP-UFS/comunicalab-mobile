import 'package:meta/meta.dart';

@immutable
abstract class FilterUserTicketListState {
  const FilterUserTicketListState();
}

class DefaultTab extends FilterUserTicketListState {
  final String keyword;
  final bool pinnedKeyword;

  const DefaultTab({this.keyword = "", this.pinnedKeyword = false});
}

class FilteringWithStatusTab extends FilterUserTicketListState {
  final String keyword;
  final bool pinnedKeyword;

  const FilteringWithStatusTab({this.keyword = "", this.pinnedKeyword = false});
}

class FilteringWithSearchBar extends FilterUserTicketListState {
  final String type;
  final String keyword;
  final bool pinnedKeyword;

  const FilteringWithSearchBar(
      {this.type = "Nome", this.keyword = "", this.pinnedKeyword = false});
}
