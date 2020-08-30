import 'package:comunica_mobile/models/call.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CallListEvent {}

class FetchCalls extends CallListEvent {}

class EditCalls extends CallListEvent {}

class DeleteCalls extends CallListEvent {}

class HideCalls extends CallListEvent {}

class CallSelected extends CallListEvent {
  final Call call;

  CallSelected({this.call});
}

// class FetchEquipments extends AddToEquipmentEvent {}

// class AddImageToEquipments extends AddToEquipmentEvent {
//   final List<Equipment> equipments;

//   AddImageToEquipments({this.equipments});
// }

// class ClearMarkedEquipments extends AddToEquipmentEvent {}

// class EquipmentSelected extends AddToEquipmentEvent {
//   final Equipment equipment;

//   EquipmentSelected({this.equipment});
// }
