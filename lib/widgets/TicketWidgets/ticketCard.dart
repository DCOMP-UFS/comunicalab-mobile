import 'package:flutter/material.dart';
import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/models/ticket.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final Function onPressedLike;
  final Function onPressedDislike;
  final Function onTap;

  TicketCard({
    this.ticket,
    this.onPressedLike,
    this.onPressedDislike,
    this.onTap,
  });

  Widget ticketProgressRow(
      BuildContext context, String status, double screenWidth) {
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
            width: (ticket.status == "Pendente")
                ? 11
                : (ticket.status == "Andamento") ? 26 : 37,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
              color: (ticket.status == "Pendente")
                  ? Color(0xFFF41616)
                  : (ticket.status == "Andamento")
                      ? Color(0xFFFFF500)
                      : Color(0xFF00FF29),
            ),
          ),
        ),
        Text(
          ticket.status,
          textScaleFactor: screenWidth * 0.0020,
        ),
      ],
    );
  }

  Widget ticketTimeRow(
      BuildContext context, DateTime date, double screenWidth) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(Icons.brightness_1, color: Colors.black26, size: 13),
          Text(
            " ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString()} ",
            textScaleFactor: screenWidth * 0.0020,
          ),
          SizedBox(width: 7.0),
          Icon(Icons.access_time, size: 13),
          Text(
            " ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}",
            textScaleFactor: screenWidth * 0.0020,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final screenHeight = isPortrait
        ? MediaQuery.of(context).size.height
        : MediaQuery.of(context).size.width;

    final screenWidth = isPortrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Container(
          height: 130,
          padding: isPortrait
              ? EdgeInsets.fromLTRB(
                  screenWidth * 0.04, 8, screenWidth * 0.04, 0)
              : EdgeInsets.fromLTRB(screenWidth * 0.4, 8, screenWidth * 0.4, 0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: InkWell(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(40, 12, 57, 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      ticket.requestingUser,
                      textScaleFactor: screenWidth * 0.0035,
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      ticket.type,
                      textScaleFactor: screenWidth * 0.0030,
                    ),
                    ticketTimeRow(context, ticket.dateTime, screenWidth),
                    ticketProgressRow(context, ticket.status, screenWidth),
                  ],
                ),
              ),
              onTap: onTap ?? () {},
            ),
          ),
        ),
        Positioned(
          bottom: screenWidth * 0.0125,
          right: isPortrait ? screenWidth * 0.08 : screenWidth * 0.42,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RawMaterialButton(
                constraints: BoxConstraints.tight(Size(40.0, 40.0)),
                shape: CircleBorder(),
                child: Icon(
                  CustomIcons.thumb_up,
                  size: screenWidth * 0.05,
                  color:
                      ticket?.liked == 'S' ? Color(0xFF000080) : Colors.black38,
                ),
                onPressed: onPressedLike,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: screenWidth * 0.08,
                ),
                child: Text(
                  ticket.likes.toString(),
                  textScaleFactor: screenWidth * 0.002,
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RawMaterialButton(
                constraints: BoxConstraints.tight(Size(40.0, 40.0)),
                shape: CircleBorder(),
                child: Icon(
                  CustomIcons.thumb_down,
                  size: screenWidth * 0.05,
                  color:
                      ticket?.liked == 'N' ? Color(0xFF000080) : Colors.black38,
                ),
                onPressed: onPressedDislike,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: screenWidth * 0.08,
                ),
                child: Text(
                  ticket.dislikes.toString(),
                  textScaleFactor: screenWidth * 0.002,
                  style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
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
