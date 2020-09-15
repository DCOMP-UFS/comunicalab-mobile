import 'package:equatable/equatable.dart';


// ignore: camel_case_types
abstract class FilterBottomSheet_event extends Equatable{

}

class CategoryEvent extends FilterBottomSheet_event{

  final String category;

  CategoryEvent (this.category);

  @override
  List<Object> get props => [category];

}

