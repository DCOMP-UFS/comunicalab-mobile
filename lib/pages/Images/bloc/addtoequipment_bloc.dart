import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/models/equipment.dart';
import './bloc.dart';

class AddToEquipmentBloc extends Bloc<AddToEquipmentEvent, AddToEquipmentState> {
  @override
  AddToEquipmentState get initialState => AddToEquipmentLoading();

  @override
  Stream<AddToEquipmentState> mapEventToState(
    AddToEquipmentEvent event,
  ) async* {
    final currentState = state;
    if (event is FetchEquipments) {
      if (currentState is AddToEquipmentLoading) {
        final equipments = await _fetchEquipments();
        yield AddToEquipmentSuccess(equipments: equipments);
      }
    } else if (event is EquipmentSelected) {
      if (currentState is AddToEquipmentSuccess) {
        final List<Equipment> updateEquipments = currentState.equipments
            .map(
              (eqp) => eqp.id == event.equipment.id ? eqp.copyWith(isMarked: event.equipment.isMarked) : eqp,
            )
            .toList();
        yield AddToEquipmentSuccess(equipments: updateEquipments);
      }
    } else if (event is ClearMarkedEquipments) {
      if (currentState is AddToEquipmentSuccess) {
        final List<Equipment> updateEquipments = currentState.equipments
        .map((eqp) {
          return eqp.copyWith(isMarked: false);
        }).toList();
        yield AddToEquipmentSuccess(equipments: updateEquipments);
      }
    }
  }
}

Future<List<Equipment>> _fetchEquipments() async {
  //Simula a resposta do servidor.
  var response = <Equipment>[
    Equipment(id: 1, name: 'Equipamento 1', isMarked: false),
    Equipment(id: 2, name: 'Equipamento 2', isMarked: false),
    Equipment(id: 3, name: 'Equipamento 3', isMarked: false),
    Equipment(id: 4, name: 'Equipamento 4', isMarked: false),
  ];

  await Future.delayed(Duration(seconds: 2)); //simula latência
  return response;
}
