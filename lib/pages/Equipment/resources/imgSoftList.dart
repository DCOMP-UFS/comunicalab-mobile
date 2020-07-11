import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/pages/Equipment/resources/bloc/imgSoftList_bloc.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/widgets/customCard.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/customBottomNavigationBar.dart';

class ImgSoftList extends StatefulWidget {
  @override
  _ImgSoftListState createState() => _ImgSoftListState();
}

class _ImgSoftListState extends State<ImgSoftList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Imagens"),
      ),
      drawer: handlerSideBar(context),
      body: Container(
        width: 400,
        height: 400,
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
