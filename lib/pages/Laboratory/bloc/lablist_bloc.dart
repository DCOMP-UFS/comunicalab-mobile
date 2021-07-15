import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/api/client_api.dart';
import './bloc.dart';

class LablistBloc extends Bloc<LablistEvent, LablistState> {
  @override
  LablistState get initialState => InitialLablistState();

  @override
  Stream<LablistState> mapEventToState(
    LablistEvent event,
  ) async* {
    if (event is LabListLoad) {
      yield LabListLoading();
      try {
        var api = ClientApi();
        var result = await api.get(endPoint: '/laboratory');
        result.fold((l) => null, (r) async* {
          yield LabListSuccess(labs: List<Map>.from(r.data));
        });
      } catch (e) {
        yield LabListError(labs: e);
      }
    }
  }
}
