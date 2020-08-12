import 'package:flutter/material.dart';
import 'package:comunica_mobile/pages/Images/widgets/customCard.dart';
import 'package:flutter/cupertino.dart';


class searchInfo extends SearchDelegate{

  List pesquisaList;

  search(_pesquisaList){
    pesquisaList=_pesquisaList;

  }


  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      Container(
        //color: Colors.red,
        child:IconButton(
          icon: Icon(Icons.clear),
          color: Colors.black,
          onPressed: (){
            query = "";
          },
        ) ,
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return Container(
      //color: Colors.green,
      child: IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          color: Colors.black,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        },
      ) ,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      child: Center(
        child: CustomCard(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container(
    );
  }

}