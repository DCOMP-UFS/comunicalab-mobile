import 'package:flutter/material.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/widgets/customCard.dart';

class ImagesList extends StatefulWidget {
  @override
  _ImagesListState createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Imagens"),
      ),
      drawer: handlerSideBar(context),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return CustomCard('Imagem ${index + 1}');
          },
        ),
      ),
    );
  }
}
