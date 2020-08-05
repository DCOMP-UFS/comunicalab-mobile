import 'package:comunica_mobile/models/equipment.dart';
import 'package:comunica_mobile/pages/Images/bloc/addtoequipment_bloc.dart';
import 'package:comunica_mobile/pages/Images/bloc/addtoequipment_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCard extends StatefulWidget {
  final String softwareName;
  final Equipment equipment;
  final void Function(int) quandoSelecionar;

  CustomCard({this.softwareName, this.equipment, this.quandoSelecionar});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {},
          child: Container(
              padding: EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    onChanged: (isMarked) {
                      widget.equipment.isMarked = isMarked;
                      BlocProvider.of<AddToEquipmentBloc>(context).add(EquipmentSelected(equipment: widget.equipment));
                    },
                    value: widget.equipment.isMarked,
                    activeColor: Color(0xFF000080),
                  ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.20,
                  // ),
                  Expanded(
                    child: Padding(
                      padding: mediaQuery.width > 400 
                      ? EdgeInsets.fromLTRB(mediaQuery.width * 0.20, 0, mediaQuery.width * 0.20, 0)
                      : EdgeInsets.fromLTRB(mediaQuery.width * 0.15, 0, mediaQuery.width * 0.15, 0),
                      child: Text(
                        widget.equipment.name,
                        style: TextStyle(),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
