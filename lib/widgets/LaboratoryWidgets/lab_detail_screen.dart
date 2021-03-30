import 'package:flutter/material.dart';

import '../../models/my_custom_clipper.dart';
import './custom_grid_tile.dart';

class LabDetailScreen extends StatelessWidget {
  final Map<String, dynamic> labData;

  LabDetailScreen(this.labData);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StripsWidget(
          color1: Color(0xff4343c3),
          color2: Color(0xff000080),
          gap: 500,
          noOfStrips: 2,
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                labData['name'].toString(),
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView(
                  children: <Widget>[
                    customGridTile(
                      label: 'Status:',
                      text: labData['status'].toString(),
                    ),
                    customGridTile(
                      label: 'Capacidade:',
                      text: labData['capacity'].toString(),
                    ),
                    customGridTile(
                      label: 'Localização:',
                      text: labData['location_id'].toString(),
                    ),
                    customGridTile(
                      label: 'Chamados Abertos:',
                    ),
                  ],
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
