import 'package:comunica_mobile/pages/Laboratory/bloc/filterBottomSheetAddLaboratory_state.dart';
import 'package:equatable/equatable.dart';


// ignore: camel_case_types
abstract class FilterBottomSheet_event extends Equatable{

}

class StateEvent extends FilterBottomSheet_event{

  final String state;

  StateEvent (this.state);

  @override
  List<Object> get props => [state];

}


