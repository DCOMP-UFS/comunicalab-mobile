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

    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    final screenWidth = mediaQuery.width * devicePixelRatio;

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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: mediaQuery.height * 0.015),
                        Text(
                          widget.equipment.name,
                          style: TextStyle(),
                        ),
                        SizedBox(height: mediaQuery.height * 0.005),
                        Text("Ar Condicionado"),
                        SizedBox(height: mediaQuery.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: screenWidth > 700 ? mediaQuery.width * 0.22 : mediaQuery.width * 0.28,
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: chooseColor(widget.equipment.option),
                                    radius: 10,
                                  ),
                                  SizedBox(
                                    width: mediaQuery.width * 0.01,
                                  ),
                                  Text(widget.equipment.option)
                                ],
                              ),
                            ),
                            Container(
                              width: screenWidth > 700 ? mediaQuery.width * 0.25 : mediaQuery.width * 0.33,
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: chooseColor(widget.equipment.disponibility),
                                    radius: 10,
                                  ),
                                  SizedBox(
                                    width: mediaQuery.width * 0.01,
                                  ),
                                  Text(widget.equipment.disponibility)
                                ],
                              ),
                            ),
                            SizedBox(width: screenWidth > 700 ? mediaQuery.width * 0.1 : 0)
                          ],
                        ),
                        SizedBox(height: mediaQuery.height * 0.015),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Color chooseColor(String option) {
    List<String> listOptions = ["Indisponível", "Rede", "Software", "Hardware"];
    if (listOptions.contains(option)) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
