import 'package:comunica_mobile/pages/Images/imagesDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String softwareName;

  CustomCard(this.softwareName);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: (){

          },
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                //contentPadding: ,
                title: Text(softwareName),
                subtitle: Text("Categoria"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}