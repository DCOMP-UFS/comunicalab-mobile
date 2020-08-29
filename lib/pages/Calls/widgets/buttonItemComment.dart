import 'package:flutter/material.dart';

class ButtonComment extends StatelessWidget {
  final String text;
  ButtonComment(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 130,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color(0xFF000080),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white,
          width: 2
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
