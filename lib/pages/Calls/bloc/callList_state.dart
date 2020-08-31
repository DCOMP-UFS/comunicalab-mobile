import 'package:comunica_mobile/models/call.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CallListState {
  final List<Call> calls;

  CallListState({this.calls});
}

class CallListLoading extends CallListState {}

class CallListSuccess extends CallListState {
  final List<Call> calls;

  CallListSuccess({this.calls});
}

class AddtoequipmentError extends CallListState {}

// @immutable
// abstract class AddToEquipmentState {
//   final List<Equipment> equipments;

//   AddToEquipmentState({this.equipments});
// }

// class AddToEquipmentLoading extends AddToEquipmentState {}

// class AddToEquipmentSuccess extends AddToEquipmentState {
//   final List<Equipment> equipments;

//   AddToEquipmentSuccess({this.equipments});
// }

// class OneEquipmentSelected extends AddToEquipmentState{
//   final Equipment equipment;

//   OneEquipmentSelected({this.equipment});
// }

// class AddtoequipmentError extends AddToEquipmentState {}