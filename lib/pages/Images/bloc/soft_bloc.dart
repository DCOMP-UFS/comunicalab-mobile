import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class softBloc extends Bloc<softEvent,softState>{

  @override
  softState get initialState => softInitial();

  @override
  Stream<softState> mapEventToState(
      softEvent event,
      ) async*{

  }

}
