import 'package:comunica_mobile/pages/Images/imagesDetails.dart';
import 'package:comunica_mobile/pages/Images/searchTela.dart';
import 'package:flutter/material.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/pages/Images/widgets/customCard.dart';


class ImagesList extends StatefulWidget {
  @override
  _ImagesListState createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {

  //final itens = List<String>.generate(8, (index) => null);

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Imagens"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>searchTela()
              ));
            },
          )
        ],
      ),
      drawer: handlerSideBar(context),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return  CustomCard('Imagem ${index + 1}');

          },
        ),
      ),
    );
  }

}
