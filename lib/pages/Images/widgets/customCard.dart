import 'package:comunica_mobile/pages/Images/imagesDetails.dart';
import 'package:comunica_mobile/pages/Images/imagesInfo.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {

  final imagesInfo imag;

  CustomCard(this.imag);

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
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>ImagesDetails(imag)
            ));
          },
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Text(imag.softwareName),
          ),
        ),
      ),
    );
  }
}
