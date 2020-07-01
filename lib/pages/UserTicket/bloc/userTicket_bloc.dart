import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/pages/UserTicket/bloc/bloc.dart';
import 'package:comunica_mobile/models/ticket.dart';

class UserTicketListBloc
    extends Bloc<UserTicketListEvent, UserTicketListState> {
  @override
  UserTicketListState get initialState => UserTicketListLoadInProgress();

  @override
  Stream<UserTicketListState> mapEventToState(
      UserTicketListEvent event) async* {
    final currentState = state;
    try {
      if (event is FetchUserTickets) {
        if (currentState is UserTicketListLoadInProgress) {
          //await Future.delayed(Duration(seconds: 2));
          final tickets = await _fetchUserTickets();
          yield UserTicketListLoadSuccess(userTickets: tickets);
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
        if (currentState is UserTicketListLoadSuccess) {}
      } else if (event is UserTicketDisliked) {
        if (currentState is UserTicketListLoadSuccess) {}
      }
    } catch (_) {
      yield UserTicketListLoadFailure();
    }
  }

  Future<List<Ticket>> _fetchUserTickets() async {
    final response = <Ticket>[
      Ticket(
        "Fulano da Silva Santos",
        "Hardware",
        "Tipo de Problema 1",
        DateTime.now(),
        "Pendente",
        200,
        30,
        false,
      ),
      Ticket(
        "Cicrano de Souza",
        "Hardware",
        "Tipo de Problema 2",
        DateTime.now(),
        "Finalizado",
        7,
        147,
        true,
      ),
      Ticket(
        "Beltrano de Santana",
        "Software",
        "Tipo de Problema 3",
        DateTime.now(),
        "Andamento",
        140,
        25,
        true,
      ),
      Ticket(
        "Java Martins",
        "Software",
        "Tipo de Problema 4",
        DateTime.now(),
        "Pendente",
        396,
        1204,
        false,
      ),
    ];
    //await Future.delayed(Duration(seconds: 3)); //simula latência
    return response;
  }
}
