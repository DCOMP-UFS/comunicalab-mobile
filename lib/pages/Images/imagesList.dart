import 'package:comunica_mobile/pages/Images/imagesDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/pages/Images/widgets/customCard.dart';

class ImagesList extends StatefulWidget {
  @override
  _ImagesListState createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {
  //final itens = List<String>.generate(8, (index) => null);

  // var title = 'Lista de Imagens';
  Widget appbarTitle = Text("Lista de Imagens");
  var searchList = List<String>.generate(8, (index) => "Imagem ${index + 1}");
  var copyList = List<String>.generate(8, (index) => "Imagem ${index + 1}");


  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(searchList);
    return Scaffold(
      appBar: AppBar(
        title:  appbarTitle,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              searchList=copyList;
              _controller.clear();
              setState(() {
                // title = '';
                appbarTitle = Container(
                  height: 30,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color(0xFFF9FDFF),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    //controller: _textEditingController,
                    decoration: InputDecoration.collapsed(
                      hintText: "Digite o nome da imagem",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onSubmitted: (text) {
                      setState(() {
                        searchList = searchList.where((element) => element == text).toList();
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
            return CustomCard(searchList[index]);
          },
        ),
      ),
    );
  }

}

