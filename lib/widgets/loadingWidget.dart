import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String message;

  LoadingWidget({this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            backgroundColor: Colors.black12,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF000080)),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              message ?? "Aguarde...",
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
