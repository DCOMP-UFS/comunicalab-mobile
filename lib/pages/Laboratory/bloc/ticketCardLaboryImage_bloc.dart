import 'package:bloc/bloc.dart';


class TicketCardLaboryImage_bloc extends Bloc<String, String>{
  @override
  get initialState => "Livre";

  @override
  Stream<String> mapEventToState(event) async* {
    switch(event){
      case "Livre":
        yield state;
        break;
      case "Reservado":
        yield state;
        break;
      case "Ocupado":
        yield state;
        break;
    }
  }
}