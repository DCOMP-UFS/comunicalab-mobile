import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class FilterticketBloc extends Bloc<FilterticketEvent, FilterticketState> {
  @override
  FilterticketState get initialState => InitialFilterticketState();

  @override
  Stream<FilterticketState> mapEventToState(
    FilterticketEvent event,
  ) async* {
    if (event is ToStatus && state is! ByStatus) {
      yield ByStatus(status: event.status);
    } else {
      if (event is ToDate && state is! ByDate) {
        yield ByDate();
      } else {
        if (event is ToType && state is! ByType) {
          yield ByType();
        } else {
          if (event is ToName && state is! ByName) {
            yield ByName();
          } else {
            if (event is ToChooseStatus && state is! ByStatus){
              yield ChoosingStatus();
            } else {
              yield InitialFilterticketState();
            }
          }
        }
      }
    }
  }
}
