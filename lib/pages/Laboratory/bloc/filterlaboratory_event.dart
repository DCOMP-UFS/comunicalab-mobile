import 'package:meta/meta.dart';

@immutable
abstract class FilterlaboratoryEvent {}

class ToStatus extends FilterlaboratoryEvent {
  final String status;
  ToStatus({
    @required this.status,
  });
}

class ToName extends FilterlaboratoryEvent {}

class ToPlace extends FilterlaboratoryEvent {}

class ToChooseStatus extends FilterlaboratoryEvent {}