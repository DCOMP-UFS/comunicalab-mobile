import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class infoBloc extends Bloc<infoEvent,infoState>{

  @override
  infoState get initialState => infoInitial();

  @override
  Stream<infoState> mapEventToState(
  infoEvent event,
  ) async*{

}

}