import 'package:comunica_mobile/pages/Images/imagesList.dart';
import 'package:comunica_mobile/pages/Images/searchInfo.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:flutter/material.dart';
import 'package:comunica_mobile/pages/Images/widgets/customCard.dart';

class searchTela extends StatefulWidget {

  @override
  _searchTelaState createState() => _searchTelaState();
}

class _searchTelaState extends State<searchTela> {

  final searchList = List<String>.generate(8, (index) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: GestureDetector(
          onTap: (){
            showSearch(context: context, delegate: searchInfo());
          },
          child: Container(
            height: 30,
            width: 300,
            //color: Colors.amberAccent,
            decoration: new BoxDecoration(
                color: Color(0xFFF9FDFF),
                borderRadius: BorderRadius.circular(20
                )),
            child: Center(
              child: Text(
                "Digite o nome da imagem",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>ImagesList()
              ));
              //showSearch(context: context, delegate: searchInfo());
            },
          )
        ],
      ),
        drawer: handlerSideBar(context),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: searchList.length,
            //itemCount: 8,
            itemBuilder: (context, idx) {
              return  CustomCard('Imagem ${idx + 1}');

            },
          ),
        ),
      );
    }
  }

