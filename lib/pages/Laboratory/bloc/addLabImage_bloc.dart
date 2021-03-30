import 'package:bloc/bloc.dart';

enum AddLabImageEvent {increment, decrement}

// ignore: camel_case_types
class AddLabImage_Bloc extends Bloc<AddLabImageEvent, int>{

  @override
  int get initialState => 0;


  @override
  Stream<int> mapEventToState(AddLabImageEvent event) async*{
    switch(event){
      case AddLabImageEvent.increment:
        yield state + 1;
        break;
      case AddLabImageEvent.decrement:
        yield state - 1;
        break;
    }

  }

}