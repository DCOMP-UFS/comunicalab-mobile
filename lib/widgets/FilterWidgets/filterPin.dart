import 'package:flutter/material.dart';

class FilterPin extends StatelessWidget {
  final String label;
  final Function onTap;
  final double verticalMargin;
  final double horizontalMargin;

  FilterPin(this.label,
      {this.onTap, this.verticalMargin = 10.0, this.horizontalMargin = 10.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: verticalMargin, horizontal: horizontalMargin),
      width: 117,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30.0),
        splashFactory: InkRipple.splashFactory,
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 7.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black54,
              ),
              child: Icon(
                Icons.cancel,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
