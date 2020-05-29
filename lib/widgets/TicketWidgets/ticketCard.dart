import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final String title;
  final String lab;
  final String status;
  final DateTime dateTime;
  final bool like;
  final int likesNumber;
  final int dislikesNumber;
  final Function onPressedLike;
  final Function onPressedDislike;

  TicketCard(
      {this.title,
      this.lab,
      this.status,
      this.dateTime,
      this.like,
      this.likesNumber,
      this.dislikesNumber,
      this.onPressedLike,
      this.onPressedDislike});

  Widget ticketProgressRow(String status) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 8),
          height: 5,
          width: 37,
          alignment: AlignmentDirectional.centerStart,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Color(0xFFC4C4C4),
          ),
          child: Container(
            height: 5,
            width:
                (status == "Pendente") ? 11 : (status == "Andamento") ? 26 : 37,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
              color: (status == "Pendente")
                  ? Color(0xFFF41616)
                  : (status == "Andamento")
                      ? Color(0xFFFFF500)
                      : Color(0xFF00FF29),
            ),
          ),
        ),
        Text(
          status,
          style: TextStyle(fontSize: 11),
        ),
      ],
    );
  }

  Widget ticketTimeRow(DateTime date) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.brightness_1, color: Colors.black26, size: 13),
          Text(
            " ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString()} ",
            style: TextStyle(fontSize: 11),
          ),
          SizedBox(width: 7.0),
          Icon(Icons.access_time, size: 13),
          Text(
            " ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}",
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 130,
          padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.fromLTRB(40, 12, 57, 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(lab, style: TextStyle(fontSize: 18)),
                  ticketTimeRow(dateTime),
                  ticketProgressRow(status),
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RawMaterialButton(
                constraints: BoxConstraints.tight(Size(40.0, 40.0)),
                shape: CircleBorder(),
                child: Icon(
                  CustomIcons.thumb_up,
                  size: 18.0,
                  color: like ?? false ? Color(0xFF000080) : Colors.black38,
                ),
                onPressed: onPressedLike,
              ),
              Text(
                likesNumber.toString(),
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              RawMaterialButton(
                constraints: BoxConstraints.tight(Size(40.0, 40.0)),
                shape: CircleBorder(),
                child: Icon(
                  CustomIcons.thumb_down,
                  size: 18.0,
                  color: like ?? true ? Colors.black38 : Color(0xFF000080),
                ),
                onPressed: onPressedDislike,
              ),
              Text(
                dislikesNumber.toString(),
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
      overflow: Overflow.clip,
    );
  }
}
