import 'package:meta/meta.dart';

@immutable
abstract class LablistState {
  final List<Map> labs = List<Map>();
}
  
class InitialLablistState extends LablistState {
  final List<Map> labs = List<Map>();
}

class LabListLoading extends LablistState {
}

class LabListSuccess extends LablistState {
  final List<Map> labs;
  LabListSuccess({
    @required this.labs,
  });
}

class LabListError extends LablistState {
  final List<Map> labs;
  LabListError({
    @required this.labs,
  });
}