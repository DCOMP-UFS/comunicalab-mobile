import 'package:comunica_mobile/models/equipment.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddToEquipmentState {}

class AddToEquipmentLoading extends AddToEquipmentState {}

class AddToEquipmentSuccess extends AddToEquipmentState {
  final List<Equipment> equipments;

  AddToEquipmentSuccess({this.equipments});
}

class AddToEquipmentMethod extends AddToEquipmentState {
  final List<Equipment> equipments;

  AddToEquipmentMethod({this.equipments});
}

class OneEquipmentSelected extends AddToEquipmentState{
  final Equipment equipment;

  OneEquipmentSelected({this.equipment});
}

class AddtoequipmentError extends AddToEquipmentState {}