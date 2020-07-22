import 'package:meta/meta.dart';

@immutable
abstract class AddtoequipmentState {}

class AddtoequipmentInitial extends AddtoequipmentState {}

class AddtoequipmentLoading extends AddtoequipmentState {

}

class AddtoequipmentSuccess extends AddtoequipmentState {
  
}

class AddtoequipmentError extends AddtoequipmentState {
  
}