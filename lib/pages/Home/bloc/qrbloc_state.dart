import 'package:meta/meta.dart';

@immutable
abstract class QrState {
  final String code = null;
}
  
class InitialQrState extends QrState {}

class LoggingIn extends QrState {
  final String code;
  LoggingIn({@required this.code});
}

class Searching extends QrState {
  final String code;
  Searching({@required this.code});
}