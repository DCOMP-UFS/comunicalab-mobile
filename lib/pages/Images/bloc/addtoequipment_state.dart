import 'package:comunica_mobile/models/equipment.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddToEquipmentState {
  final List<Equipment> equipments;

  AddToEquipmentState({this.equipments});
}

class AddToEquipmentLoading extends AddToEquipmentState {}

class AddToEquipmentSuccess extends AddToEquipmentState {
  final List<Equipment> equipments;

  // Filtro
  final Map<String, dynamic> filter;

  // AddToEquipmentSuccess({this.equipments});

   AddToEquipmentSuccess({
    this.equipments,
    this.filter = const <String, dynamic>{
      "name": null,
      "category": null,
    }, //inicializa o Map caso não haja filtro
  });

  AddToEquipmentSuccess copyWith({
    final List<Equipment> equipments,
    final Map<String, dynamic> filter,
  }) {
    return AddToEquipmentSuccess(
      equipments: equipments ?? this.equipments,
      filter: filter ?? this.filter,
    );
  }
}

class OneEquipmentSelected extends AddToEquipmentState{
  final Equipment equipment;

  OneEquipmentSelected({this.equipment});
}

class AddtoequipmentError extends AddToEquipmentState {}