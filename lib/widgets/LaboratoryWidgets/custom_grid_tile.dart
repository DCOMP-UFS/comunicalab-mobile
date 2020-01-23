import 'package:flutter/material.dart';

GridTile customGridTile({
  @required String label,
  String text = 'Desconhecido',
}) {
  return GridTile(
    child: Card(
      color: Color(0xFFE0F6FF),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0x00FFFFFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.2,
              0.8,
            ],
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
