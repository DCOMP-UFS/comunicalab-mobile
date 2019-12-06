import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  @override
  QrState get initialState => InitialQrState();

  @override
  Stream<QrState> mapEventToState(
    QrEvent event,
  ) async* {
    if(event is Login){
      if (state is LoggingIn) { 
        yield InitialQrState();
      } else {
        yield LoggingIn(code: event.code);
      }
    } else if (event is Search){
      if (state is Searching) { 
        yield InitialQrState();
      } else {
        yield Searching(code: event.code);
      }
    }
  }
}
