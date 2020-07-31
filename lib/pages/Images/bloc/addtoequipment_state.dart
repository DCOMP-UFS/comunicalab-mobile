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

  AddToEquipmentSuccess({this.equipments});
}

class OneEquipmentSelected extends AddToEquipmentState{
  final Equipment equipment;

  OneEquipmentSelected({this.equipment});
}

class AddtoequipmentError extends AddToEquipmentState {}