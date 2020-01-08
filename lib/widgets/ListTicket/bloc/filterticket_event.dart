import 'package:meta/meta.dart';

@immutable
abstract class FilterticketEvent {}

class ToStatus extends FilterticketEvent {
  final String status;
  ToStatus({
    @required this.status,
  });
}

class ToDate extends FilterticketEvent {}

class ToType extends FilterticketEvent {}

class ToName extends FilterticketEvent {}

class ToChooseStatus extends FilterticketEvent {}