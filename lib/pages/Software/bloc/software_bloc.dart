import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoftwareBloc extends Bloc<bool, bool > {
  @override
  // TODO: implement initialState
  bool get initialState => false;

  @override
  Stream<bool> mapEventToState(bool event) async* {
    yield event;
  }



}