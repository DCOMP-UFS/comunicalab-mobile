import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/pages/UserTicket/bloc/filterUserTicketList/bloc.dart';

class FilterUserTicketListBloc
    extends Bloc<FilterUserTicketListEvent, FilterUserTicketListState> {
  @override
  FilterUserTicketListState get initialState => DefaultTab();

  @override
  Stream<FilterUserTicketListState> mapEventToState(
      FilterUserTicketListEvent event) async* {
    if (event is SearchIconPressed) {
      yield FilteringWithSearchBar();
    } else if (event is BackIconPressed) {
      yield DefaultTab();
    } else if (event is FilterBy) {
      if (event?.type == "Status") {
        yield FilteringWithStatusTab();
      } else {
        FilteringWithSearchBar(
          type: event?.type,
          keyword: event?.keyword,
        );
      }
    } else if (event is AddFilterPin) {
      yield FilteringWithSearchBar(
        keyword: event?.keyword,
        pinnedKeyword: true,
      );
    } else if (event is RemoveFilterPin) {
      yield FilteringWithSearchBar();
    }
  }
}
