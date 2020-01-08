import 'package:meta/meta.dart';

@immutable
abstract class FilterlaboratoryState {
  final String status = null;
}
  
class InitialFilterlaboratoryState extends FilterlaboratoryState {}

class ByStatus extends FilterlaboratoryState {
  final String status;
  ByStatus({
    @required this.status,
  });
}

class ByName extends FilterlaboratoryState {}

class ByPlace extends FilterlaboratoryState {}

class ChoosingStatus extends FilterlaboratoryState {}