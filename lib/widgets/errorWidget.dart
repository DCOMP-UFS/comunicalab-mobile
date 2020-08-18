import 'package:flutter/material.dart';
import 'package:comunica_mobile/icons/custom_icons_icons.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;

  ErrorMessageWidget({this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            CustomIcons.information,
            color: Colors.black26,
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              message ?? "Ocorreu um erro.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
