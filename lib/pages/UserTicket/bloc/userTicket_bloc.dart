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
          final tickets = await _fetchUserTickets();
          yield UserTicketListLoadSuccess(userTickets: tickets);
        }
      } else if (event is ApplyFilter) {
        if (currentState is UserTicketListLoadSuccess) {
          yield currentState.copyWith(
            filter: event?.filter,
          );
        }
      } else if (event is UserTicketLiked) {
        if (currentState is UserTicketListLoadSuccess) {
          final List<Ticket> _updatedUserTickets = currentState.userTickets
              .map((ticket) => ticket.id == event.ticket.id
                  ? ticket.copyWith(
                      liked: ticket.liked == 'S' ? '' : 'S',
                      likes: ticket.liked == 'S'
                          ? ticket.likes - 1
                          : ticket.likes + 1,
                      dislikes: ticket.liked == 'N'
                          ? ticket.dislikes - 1
                          : ticket.dislikes,
                    )
                  : ticket)
              .toList();
          yield currentState.copyWith(userTickets: _updatedUserTickets);
        }
      } else if (event is UserTicketDisliked) {
        if (currentState is UserTicketListLoadSuccess) {
          final List<Ticket> _updatedUserTickets = currentState.userTickets
              .map((ticket) => ticket.id == event.ticket.id
                  ? ticket.copyWith(
                      liked: ticket.liked == 'N' ? '' : 'N',
                      likes:
                          ticket.liked == 'S' ? ticket.likes - 1 : ticket.likes,
                      dislikes: ticket.liked == 'N'
                          ? ticket.dislikes - 1
                          : ticket.dislikes + 1,
                    )
                  : ticket)
              .toList();
          yield currentState.copyWith(userTickets: _updatedUserTickets);
        }
      }
    } catch (_) {
      yield UserTicketListLoadFailure();
    }
  }

  Future<List<Ticket>> _fetchUserTickets() async {
    //Simula a resposta do servidor.
    var response = <Ticket>[
      Ticket(
        id: 1,
        requestingUser: "Fulano da Silva Santos",
        category: "Hardware",
        type: "Tipo de Problema 1",
        dateTime: DateTime.now(),
        status: "Pendente",
        likes: 200,
        dislikes: 30,
        liked: 'S',
      ),
      Ticket(
        id: 2,
        requestingUser: "Cicrano de Souza",
        category: "Hardware",
        type: "Tipo de Problema 2",
        dateTime: DateTime.now(),
        status: "Finalizado",
        likes: 7,
        dislikes: 147,
        liked: 'N',
      ),
      Ticket(
        id: 3,
        requestingUser: "Beltrano de Santana",
        category: "Software",
        type: "Tipo de Problema 3",
        dateTime: DateTime.now(),
        status: "Andamento",
        likes: 140,
        dislikes: 25,
        liked: 'S',
      ),
      Ticket(
        id: 4,
        requestingUser: "Java Martins",
        category: "Software",
        type: "Tipo de Problema 4",
        dateTime: DateTime.now(),
        status: "Pendente",
        likes: 396,
        dislikes: 1204,
        liked: 'N',
      ),
    ];

    response.sort(); //Ordena os chamados de acordo com o seu status;
    await Future.delayed(Duration(seconds: 3)); //simula latência
    return response;
  }
}
