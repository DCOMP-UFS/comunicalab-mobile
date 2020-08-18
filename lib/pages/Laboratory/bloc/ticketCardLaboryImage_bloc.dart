import 'package:bloc/bloc.dart';

enum TicketCardLaboryImage_event {Livre, Reservado, Ocupado}

class TicketCardLaboryImage_bloc extends Bloc<TicketCardLaboryImage_event, String>{
  @override
  get initialState => "Livre";

  @override
  Stream<String> mapEventToState(TicketCardLaboryImage_event event) async* {

    switch(event){
      case TicketCardLaboryImage_event.Livre:
        yield "Livre";
        break;
      case TicketCardLaboryImage_event.Ocupado:
        yield "Ocupado";
        break;
      case TicketCardLaboryImage_event.Reservado:
        yield "Reservado";
        break;
    }


  }
}