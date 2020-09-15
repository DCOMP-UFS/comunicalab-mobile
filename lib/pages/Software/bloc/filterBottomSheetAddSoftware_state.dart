import 'package:equatable/equatable.dart';

// ignore: camel_case_types
abstract class FilterBottomSheet_state extends Equatable{
  const FilterBottomSheet_state();
}

class CategoryState extends FilterBottomSheet_state{

  final String category;

  CategoryState(this.category);

  @override
  List<Object> get props => [category];

}

