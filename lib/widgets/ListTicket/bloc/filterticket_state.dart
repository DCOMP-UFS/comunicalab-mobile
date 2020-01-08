import 'package:meta/meta.dart';

@immutable
abstract class FilterticketState {
  final String status = null;
}
  
class InitialFilterticketState extends FilterticketState {}

class ByStatus extends FilterticketState {
  final String status;
  ByStatus({
    @required this.status,
  });
}

class ByDate extends FilterticketState {}

class ByType extends FilterticketState {}

class ByName extends FilterticketState {}

class ChoosingStatus extends FilterticketState {}