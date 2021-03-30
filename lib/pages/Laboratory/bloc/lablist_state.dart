import 'package:comunica_mobile/models/lab.dart';
import 'package:meta/meta.dart';
import 'package:comunica_mobile/models/lab.dart';

@immutable
abstract class LablistState {
  const LablistState();
  //final List<Map> labs = List<Map>();
}

class InitialLablistState extends LablistState {}

class LabsListLoading extends LablistState {}

class LabListSuccess extends LablistState {
  //Chamados
  final List<Map> labsList;

  //Filtro
  final Map<String, dynamic> filter;

  const LabListSuccess({
    this.labsList,
    this.filter = const <String, dynamic>{
      'name': null,
      'status': null,
      'location': null,
    },
  });

  LabListSuccess copyWith({
    final List<Map> labsList,
    final Map<String, dynamic> filter,
  }) {
    return LabListSuccess(
      labsList: labsList ?? this.labsList,
      filter: filter ?? this.filter,
    );
  }
}

class LabListError extends LablistState {}
