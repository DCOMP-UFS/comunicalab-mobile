import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String label;
  final bool pressed;
  final Color fillColor;
  final Color labelColor;
  final Function onPressed;

  MenuItem(this.label,
      {this.pressed = false, this.fillColor, this.labelColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: fillColor ?? Colors.white,
          width: 2.0,
        ),
      ),
      fillColor: pressed ? Color(0xFF000080) : fillColor ?? Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          label,
          style: TextStyle(
            color: pressed ? Colors.white : labelColor ?? Color(0xFF000080),
            fontSize: 16,
          ),
        ),
      ),
      onPressed: onPressed ?? () {},
    );
  }
}
