import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/api.dart';
import 'package:dio/dio.dart';
import './bloc.dart';

class LablistBloc extends Bloc<LablistEvent, LablistState> {
  @override
  LablistState get initialState => InitialLablistState();

  @override
  Stream<LablistState> mapEventToState(
    LablistEvent event,
  ) async* {
    if(event is LabListLoad){
      yield LabListLoading();
      try{
        Response response = await getLabs();
        yield LabListSuccess(labs: List<Map>.from(response.data));
      } catch(e) {
        yield LabListError(labs: e);
      }
    }
  }
}
