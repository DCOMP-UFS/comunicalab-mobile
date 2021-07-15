import 'package:meta/meta.dart';

@immutable
abstract class LablistEvent {
  const LablistEvent();
}

class FetchLabsList extends LablistEvent {}

class ApplyFilterLab extends LablistEvent {
  //Futuramente esses parametros podem ser substituídos pela model que trata a integração com a API
  final Map<String, dynamic> filter;

  const ApplyFilterLab(this.filter);
}
