import 'package:comunica_mobile/models/call.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CallListEvent {}

class FetchCalls extends CallListEvent {}

class EditCall extends CallListEvent {}

class DeleteCall extends CallListEvent {
  final Call call;

  DeleteCall({this.call});
}

class HideCall extends CallListEvent {
  final Call call;

  HideCall({this.call});
}

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
