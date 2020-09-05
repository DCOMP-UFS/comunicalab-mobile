import 'package:bloc/bloc.dart';

enum FilterEvent {cat1,cat2,cat3,cat4}

// ignore: camel_case_types
class FilterBottomSheet_Bloc extends Bloc<FilterEvent, String>{

  @override
  String get initialState => "Categoria 1";


  @override
  Stream<String> mapEventToState(FilterEvent event) async*{
    switch(event){
      case FilterEvent.cat1:
        print("object 1");
        yield "Categoria 1";
        break;
      case FilterEvent.cat2:
        print("object 2");
        yield "Categoria 2";
        break;
      case FilterEvent.cat3:
        print("object 3");
        yield "Categoria 3";
        break;
      case FilterEvent.cat4:
        print("object 4");
        yield "Categoria 4";
        break;
    }
  }

}