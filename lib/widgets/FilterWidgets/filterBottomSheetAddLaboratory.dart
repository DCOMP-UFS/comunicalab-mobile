import 'package:flutter/material.dart';

TextEditingController _textControl = new TextEditingController();

Future filterBottomSheetLaboratory<Map>({
  @required BuildContext context,
  String name,
  String location,
  String status,
}) async {
  return showModalBottomSheet<Map>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      builder: (BuildContext context) {
        String _dropDown;
        String _name;
        var filter = <String, dynamic>{
          'name': name,
          'location': location,
          'status': status
        };

        return StatefulBuilder(
            builder: (BuildContext context, StateSetter updatePreferences) {
          return Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20.0,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    "Filtro",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF000080),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkResponse(
                                        splashFactory: InkRipple.splashFactory,
                                        child: Container(
                                          child: Icon(
                                            Icons.close,
                                            color: Color(0xFF625F5F),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      InkResponse(
                                        splashFactory: InkRipple.splashFactory,
                                        child: Container(
                                          child: Text(
                                            "Limpar",
                                            style: TextStyle(
                                                color: Color(0xFF625F5F),
                                                fontSize: 16),
                                          ),
                                        ),
                                        onTap: () {
                                          updatePreferences(() {
                                            _dropDown = null;
                                            _textControl.clear();
                                            filter.updateAll(
                                                (key, value) => null);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 4.0,
                              ),
                              child: Text(
                                'Nome do Laboratório',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 18),
                                      height: 45,
                                      //alignment: Alignment.centerLeft,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: Color(0xFFE0DFDF),
                                          width: 2,
                                        ),
                                      ),
                                      child: Theme(
                                        data: new ThemeData(
                                          primaryColor: Colors.transparent,
                                          primaryColorDark: Colors.transparent,
                                        ),
                                        child: TextField(
                                          controller: _textControl,
                                          autofocus: false,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 16.0,
                                              height: 1.5),
                                          decoration: new InputDecoration(
                                            hintText:
                                                "Digite o nome do laboratório",
                                            enabledBorder:
                                                new OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: 8.0,
                                          horizontal: 4.0,
                                        ),
                                        child: Text(
                                          'Localização',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashFactory: InkRipple.splashFactory,
                                      borderRadius: BorderRadius.circular(8.0),
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Color(0xFFE0DFDF),
                                            width: 2,
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            value: _dropDown,
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            onChanged: (String newValue) {
                                              updatePreferences(() {
                                                _dropDown = newValue;
                                                filter['location'] = _dropDown;
                                              });
                                            },
                                            hint: Text(
                                              "Escolha uma Localização",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black45),
                                            ),
                                            items: <String>[
                                              "Localização 1",
                                              "Localização 2",
                                              "Localização 3",
                                              "Localização 4"
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 8.0,
                                        horizontal: 4.0,
                                      ),
                                      child: Text(
                                        'Status',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        FlatButton(
                                          color: filter["status"] == 'Livre'
                                              ? Color(0xFF00FF29)
                                              : Color(0xFFEAEAEA),
                                          highlightColor: Color(0xFF00FF29),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Text(
                                            'Livre',
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                          onPressed: () {
                                            updatePreferences(() {
                                              filter["status"] == 'Livre'
                                                  ? filter["status"] = null
                                                  : filter["status"] = 'Livre';
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: filter["status"] == 'Reservado'
                                              ? Color(0xFFFFF500)
                                              : Color(0xFFEAEAEA),
                                          highlightColor: Color(0xFFFFF500),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Text(
                                            'Reservado',
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                          onPressed: () {
                                            updatePreferences(() {
                                              filter["status"] == 'Reservado'
                                                  ? filter["status"] = null
                                                  : filter["status"] =
                                                      'Reservado';
                                            });
                                          },
                                        ),
                                        FlatButton(
                                          color: filter["status"] == 'Ocupado'
                                              ? Color(0xFFFF0000)
                                              : Color(0xFFEAEAEA),
                                          highlightColor: Color(0xFFFF0000),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Text(
                                            'Ocupado',
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                          onPressed: () {
                                            updatePreferences(() {
                                              filter["status"] == 'Ocupado'
                                                  ? filter["status"] = null
                                                  : filter["status"] =
                                                      'Ocupado';
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 25.0,
                                horizontal: 2.0,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: FlatButton(
                                  color: Color(0xFF000080),
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    'Aplicar filtro',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                  onPressed: () async {
                                    updatePreferences(() {
                                      if (_textControl.text != "") {
                                        filter['name'] = _textControl.text;
                                      }
                                    });
                                    Navigator.pop(context, filter);
                                  },
                                ),
                              ),
                            ),
                          ]))));
        });
      });
}
