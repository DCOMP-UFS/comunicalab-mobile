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
          onTap: (){},
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Text(softwareName),
          ),
        ),
      ),
    );
  }
}
