import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AddtoequipmentBloc extends Bloc<AddtoequipmentEvent, AddtoequipmentState> {
  @override
  AddtoequipmentState get initialState => AddtoequipmentInitial();

  @override
  Stream<AddtoequipmentState> mapEventToState(
    AddtoequipmentEvent event,
  ) async* {
    if( event is AddToEquipmentPressed){
      
    }
  }
}
