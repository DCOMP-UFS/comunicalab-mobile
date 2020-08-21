import 'package:comunica_mobile/pages/Images/imagesDetails.dart';
import 'package:comunica_mobile/pages/Images/imagesInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/pages/Images/widgets/customCard.dart';

class ImagesList extends StatefulWidget {
  @override
  _ImagesListState createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  _ImagesListState();

  List<imagesInfo> searchList = [
    imagesInfo(
      softwareName: "Imagem 1",
      dataCriacao: "20/11/2001",
      numeroInstalacoes: "21",
      softwaresInstalados: "22",
      ultimaAtualizacao: "17/08/2020",
    ),
    imagesInfo(
      softwareName: "Imagem 2",
      dataCriacao: "20/11/2002",
      numeroInstalacoes: "22",
      softwaresInstalados: "22",
      ultimaAtualizacao: "17/08/2020",
    ),
    imagesInfo(
      softwareName: "Imagem 3",
      dataCriacao: "20/11/2003",
      numeroInstalacoes: "23",
      softwaresInstalados: "22",
      ultimaAtualizacao: "17/08/2020",
    ),
    imagesInfo(
      softwareName: "Imagem 4",
      dataCriacao: "20/11/2004",
      numeroInstalacoes: "24",
      softwaresInstalados: "22",
      ultimaAtualizacao: "17/08/2020",
    ),
  ];

  List<imagesInfo> response = [
    imagesInfo(
      softwareName: "Imagem 1",
      dataCriacao: "20/11/2001",
      numeroInstalacoes: "21",
      softwaresInstalados: "22",
      ultimaAtualizacao: "17/08/2020",
    ),
    imagesInfo(
      softwareName: "Imagem 2",
      dataCriacao: "20/11/2002",
      numeroInstalacoes: "22",
      softwaresInstalados: "22",
      ultimaAtualizacao: "17/08/2020",
    ),
    imagesInfo(
      softwareName: "Imagem 3",
      dataCriacao: "20/11/2003",
      numeroInstalacoes: "23",
      softwaresInstalados: "22",
      ultimaAtualizacao: "17/08/2020",
    ),
    imagesInfo(
      softwareName: "Imagem 4",
      dataCriacao: "20/11/2004",
      numeroInstalacoes: "24",
      softwaresInstalados: "22",
      ultimaAtualizacao: "17/08/2020",
    ),
  ];

  Widget appbarTitle = Text("Lista de Imagens");

  final TextEditingController _controller = new TextEditingController();

  bool isSearchEnabled = false;

  switchSearchBarState(){
    setState(() {
      isSearchEnabled = true;
    });
  }

  //IconData icon = Icons.search;

  @override
  Widget build(BuildContext context) {
    print('search: ${searchList.map((e) => e.softwareName).toList()}');
    print('copia:${response.map((e) => e.softwareName).toList()}');
    return Scaffold(
      appBar: AppBar(
        title: appbarTitle,
        actions: <Widget>[
          IconButton(
            //icon: Icon(icon),
            icon: Icon(_controller.text.length>0 ? Icons.close : Icons.search),
            onPressed: () {
             // if(icon == Icons.close){
                switchSearchBarState();
                _controller.clear();
                searchList = response.map((e) => e).toList();
              //}
              setState(() {
                appbarTitle = Container(
                  height: 30,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFFF9FDFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    decoration: InputDecoration.collapsed(
                      hintText: "Digite o nome da imagem",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onSubmitted: (text) {
                      setState(() {
                        searchList = response.map((e) => e).toList();
                        searchList = searchList.where((element) => element.softwareName == text).toList();
                      });
                    },
                    onChanged: (text){
                      //if(text.length == 0){
                        setState(() {
                          searchList = response.map((e) => e).toList();
                          //icon = Icons.search;
                          //icon = Icons.close;
                        });
                     // } //else {
                        //icon = Icons.close;
                     // }
                    },
                  ),
                );
              });
            },
          )
        ],
      ),
      drawer: handlerSideBar(context),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: searchList.length,
          itemBuilder: (context, index) {
            return CustomCard(searchList[index]);
          },
        ),
      ),
    );
  }


}

