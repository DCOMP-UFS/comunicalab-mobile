import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class FilterlaboratoryBloc extends Bloc<FilterlaboratoryEvent, FilterlaboratoryState> {
  @override
  FilterlaboratoryState get initialState => InitialFilterlaboratoryState();

  @override
  Stream<FilterlaboratoryState> mapEventToState(
    FilterlaboratoryEvent event,
  ) async* {
    if (event is ToStatus && state is! ByStatus) {
      yield ByStatus(status: event.status);
    } else {
      if (event is ToName && state is! ByName) {
        yield ByName();
      } else {
        if (event is ToPlace && state is! ByPlace) {
          yield ByPlace();
        } else {
          if (event is ToChooseStatus && state is! ByStatus){
            yield ChoosingStatus();
          } else {
            yield InitialFilterlaboratoryState();
          }
        }
      }
    }
  }
}
