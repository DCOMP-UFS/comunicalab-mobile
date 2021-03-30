import 'package:bloc/bloc.dart';

enum CustomBottomNavigationBarEvent { opcao1, opcao2, opcao3 }

class CustomBottomNavigationBarBloc
    extends Bloc<CustomBottomNavigationBarEvent, int> {
  @override
  int get initialState => 0;

  //TODO: Funções que podem ser utilizadas para controle da Bottom Navigation Bar
  void opcao1Handler() {
    print('Opção 1 da Bottom Navigation Bar selecionada');
  }

  void opcao2Handler() {
    print('Opção 2 da Bottom Navigation Bar selecionada');
  }

  void opcao3Handler() {
    print('Opção 3 da Bottom Navigation Bar selecionada');
  }

  @override
  Stream<int> mapEventToState(CustomBottomNavigationBarEvent event) async* {
    switch (event) {
      case CustomBottomNavigationBarEvent.opcao1:
        yield 0;
        opcao1Handler();
        break;
      case CustomBottomNavigationBarEvent.opcao2:
        yield 1;
        opcao2Handler();
        break;
      case CustomBottomNavigationBarEvent.opcao3:
        yield 2;
        opcao3Handler();
        break;
    }
  }
}
