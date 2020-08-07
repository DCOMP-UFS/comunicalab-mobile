import 'package:comunica_mobile/pages/Images/imagesDetails.dart';
import 'package:flutter/material.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/pages/Images/widgets/customCard.dart';


class ImagesList extends StatefulWidget {
  @override
  _ImagesListState createState() => _ImagesListState();
}

class _ImagesListState extends State<ImagesList> {

  TextEditingController editingController = TextEditingController();




  //final itens = List<String>.generate(8, (index) => null);


  bool isSearchEnabled = false;

  switchSearchBarState(){
    setState(() {
      isSearchEnabled = !isSearchEnabled;
    });
  }




  @override




  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearchEnabled ? Text("Lista de Imagens"): Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: TextField(
            //onChanged
            onChanged: (String str){
              print(str);
            },
            controller: editingController,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
                hintText: "Digite o nome da imagem",
                hintStyle: TextStyle(color: Colors.black),


              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),

              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),


              filled: true,
              fillColor: Colors.grey,
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(isSearchEnabled ? Icons.close : Icons.search),
            onPressed: switchSearchBarState,
          ),
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
