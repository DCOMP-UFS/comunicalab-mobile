import 'package:meta/meta.dart';

@immutable
abstract class QrEvent {
  final String code = null;
}

class Login extends QrEvent{
  final String code;
  Login({@required this.code});
}

class Search extends QrEvent{
  final String code;
  Search({@required this.code});
}