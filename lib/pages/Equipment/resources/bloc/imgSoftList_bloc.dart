import 'package:bloc/bloc.dart';

enum ImgSoftEvent { isImage, isSoftware }

class ImgSoftListBloc extends Bloc<ImgSoftEvent, int> {
  @override
  int get initialState => 1;

  void isImageHandler() {
    //TODO: Esta função pode ser usada para tratar o estado da tela quando a tab de Imagens está selecionada.
    print('Estou na aba de Imagens');
  }

  void isSoftwareHandler() {
    //TODO: Esta função pode ser usada para tratar o estado da tela quando a tab de Softwares está selecionada.
    print('Estou na aba de Softwares');
  }

  //TODO: Modificar o tipo do Stream (int) conforme surgir a necessidade.
  @override
  Stream<int> mapEventToState(ImgSoftEvent event) async* {
    switch (event) {
      case ImgSoftEvent.isImage:
        yield 1;
        isImageHandler();
        break;
      case ImgSoftEvent.isSoftware:
        yield 2;
        isSoftwareHandler();
        break;
    }
  }
}
