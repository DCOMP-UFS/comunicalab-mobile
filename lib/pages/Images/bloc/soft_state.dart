import 'package:meta/meta.dart';

@immutable
abstract class softState{}

class softInitial extends softState{}

class softLoading extends softState{}

class softSuccess extends softState{}

class softError extends softState{}