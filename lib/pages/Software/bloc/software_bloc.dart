import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SoftwareEvent {increment, decrement}

class SoftwareBloc extends Bloc<SoftwareEvent, int > {

  @override
  int get initialState => 0;


  @override
  Stream<int> mapEventToState(SoftwareEvent event) async* {
    switch(event){
      case SoftwareEvent.increment:
        yield state + 1;
        break;
      case SoftwareEvent.decrement:
        yield state - 1;
        break;
    }

  }



}