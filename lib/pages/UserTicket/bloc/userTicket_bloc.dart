import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/pages/UserTicket/bloc/bloc.dart';

class UserTicketListBloc
    extends Bloc<UserTicketListEvent, UserTicketListState> {
  @override
  UserTicketListState get initialState => UserTicketListLoadInProgress();

  int likes = 10;
  int dislikes = 20;
  bool like;

  @override
  Stream<UserTicketListState> mapEventToState(
      UserTicketListEvent event) async* {
    final currentState = state;
    try {
      if (event is FetchUserTickets) {
        if (currentState is UserTicketListLoadInProgress) {
          await Future.delayed(Duration(seconds: 2));
          yield UserTicketListLoadSuccess();
        }
      } else if (event is ApplyFilter) {
        yield UserTicketListLoadSuccess(
          dateTime: event?.dateTime,
          troubleType: event?.troubleType,
          ticketStatus: event?.ticketStatus,
        );
      } else if (event is CleanFilter) {
        yield UserTicketListLoadSuccess();
      } else if (event is UserTicketLiked) {
        if (currentState is UserTicketListLoadSuccess) {
          if (like == null) {
            like = true;
            likes++;
          } else if (like == true) {
            like = null;
            likes--;
          } else if (like == false) {
            like = true;
            likes++;
            dislikes--;
          }
          yield currentState.copyWith();
        }
      } else if (event is UserTicketDisliked) {
        if (currentState is UserTicketListLoadSuccess) {
          if (like == null) {
            like = false;
            dislikes++;
          } else if (like == false) {
            like = null;
            dislikes--;
          } else if (like == true) {
            like = false;
            dislikes++;
            likes--;
          }
          yield currentState.copyWith();
        }
      }
      yield state;
    } catch (_) {
      yield UserTicketListLoadFailure();
    }
  }
}
