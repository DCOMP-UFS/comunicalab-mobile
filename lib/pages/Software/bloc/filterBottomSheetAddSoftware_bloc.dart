import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/pages/Software/bloc/filterBottomSheetAddSoftware_event.dart';
import 'package:comunica_mobile/pages/Software/bloc/filterBottomSheetAddSoftware_state.dart';

//enum FilterEvent {cat1,cat2,cat3,cat4}

// ignore: camel_case_types
class FilterBottomSheet_Bloc extends Bloc<FilterBottomSheet_event, FilterBottomSheet_state>{

  @override
   CategoryState get initialState => CategoryState(" ");


  @override
  Stream<CategoryState> mapEventToState(FilterBottomSheet_event event) async*{

    if(event is CategoryEvent){
      yield CategoryState(event.category);
    }

    /*switch(event){
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
    }*/
  }
}