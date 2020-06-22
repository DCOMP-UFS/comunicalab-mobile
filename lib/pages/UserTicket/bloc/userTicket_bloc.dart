import 'package:bloc/bloc.dart';
import 'file:///D:/comunicalab-mobile/lib/pages/UserTicket/bloc/bloc.dart';

class UserTicketListBloc
    extends Bloc<FilterUserTicketListEvent, FilterUserTicketListState> {
  @override
  FilterUserTicketListState get initialState => NoFilter();

  DateTime dateTime;
  String troubleType;
  String ticketStatus;

  @override
  Stream<FilterUserTicketListState> mapEventToState(
      FilterUserTicketListEvent event) async* {
    if (event is ApplyFilter) {
      yield Filtered();
    } else if (event is CleanFilter) {
      dateTime = null;
      troubleType = "";
      ticketStatus = "";
      yield NoFilter();
    }
  }
}
