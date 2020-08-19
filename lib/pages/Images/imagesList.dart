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

  final response = <imagesInfo>[
    imagesInfo(
      softwareName:"Imagem 1",
      dataCriacao:"20/11/2001",
      numeroInstalacoes:"21",
      softwaresInstalados:"22",
      ultimaAtualizacao:"17/08/2020",
    ),
    imagesInfo(
      softwareName:"Imagem 2",
      dataCriacao:"20/11/2002",
      numeroInstalacoes:"22",
      softwaresInstalados:"22",
      ultimaAtualizacao:"17/08/2020",
    ),
    imagesInfo(
      softwareName:"Imagem 3",
      dataCriacao:"20/11/2003",
      numeroInstalacoes:"23",
      softwaresInstalados:"22",
      ultimaAtualizacao:"17/08/2020",
    ),
    imagesInfo(
      softwareName:"Imagem 4",
      dataCriacao:"20/11/2004",
      numeroInstalacoes:"24",
      softwaresInstalados:"22",
      ultimaAtualizacao:"17/08/2020",
    ),
  ];

  //final itens = List<String>.generate(8, (index) => null);

  // var title = 'Lista de Imagens';
  Widget appbarTitle = Text("Lista de Imagens");
  //var searchList = List<String>.generate(4, (index) => "Imagem ${index + 1}");
  //var searchList = response.map((e) => e.softwareName).toList();

  //var copyList = List<String>.generate(4, (index) => "Imagem ${index + 1}");


  final TextEditingController _controller = new TextEditingController();

  bool isSearchEnabled = false;

  switchSearchBarState(){
    setState(() {
      isSearchEnabled = true;
    });
  }






  @override
  Widget build(BuildContext context) {

    var searchList = response.map((e) => e.softwareName).toList();
    var copyList = response.map((e) => e.softwareName).toList();


    print(searchList);
    return Scaffold(
      appBar: AppBar(
        title:  appbarTitle,
        actions: <Widget>[
          IconButton(
            icon: Icon(_controller.text.length>0 ? Icons.close : Icons.search),
            onPressed: () {
              switchSearchBarState();
              searchList=copyList;
              _controller.clear();
              setState(() {
                // title = '';
                appbarTitle = Container(
                  height: 30,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color(0xFFF9FDFF),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    //controller: _textEditingController,
                    decoration: InputDecoration.collapsed(
                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                      hintText: "Digite o nome da imagem",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onSubmitted: (text) {
                      setState(() {
                        //searchList = searchList.where((element) => element == text).toList();
                         response.removeWhere((searchList) => searchList.softwareName != text);
                      });
                    },
                    onChanged: (text){
                      setState(() {
                        searchList=copyList;
                      });
                    },
                  ),
                );
              });
            },
          )
        ],
      ),
      drawer: handlerSideBar(context),
      body:  Container(
        margin: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: searchList.length,
          itemBuilder: (context, index) {
            return CustomCard(response[index]);
          },
        ),
      ),
    );
  }

}

