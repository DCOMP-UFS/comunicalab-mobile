import 'package:comunica_mobile/models/equipment.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddToEquipmentEvent {}

class FetchEquipments extends AddToEquipmentEvent {}

class AddImageToEquipments extends AddToEquipmentEvent {
  final List<Equipment> equipments;

  AddImageToEquipments({this.equipments});
}

class ClearMarkedEquipments extends AddToEquipmentEvent {}

class ApplyFilter extends AddToEquipmentEvent {
  final Map<String, dynamic> filter;

  ApplyFilter(this.filter);
}

class EquipmentSelected extends AddToEquipmentEvent {
  final Equipment equipment;

  EquipmentSelected({this.equipment});
}
