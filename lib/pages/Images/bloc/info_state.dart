import 'package:meta/meta.dart';

@immutable
abstract class infoState{}

class infoInitial extends infoState{}

class infoLoading extends infoState{}

class infoSuccess extends infoState{}

class infoError extends infoState{}