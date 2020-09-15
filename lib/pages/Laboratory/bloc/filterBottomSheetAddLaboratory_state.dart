import 'package:equatable/equatable.dart';

// ignore: camel_case_types
abstract class FilterBottomSheet_state extends Equatable{
  const FilterBottomSheet_state();
}

class State extends FilterBottomSheet_state{

  final String state;

  State(this.state);

  @override
  List<Object> get props => [state];
}
