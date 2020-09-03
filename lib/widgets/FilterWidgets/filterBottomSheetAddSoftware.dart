import 'package:flutter/material.dart';

class FilterBottomSheetAddSoftware{

void modalBottomSheet(context){
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0)
        )
      ),
      context: context,
      builder: (BuildContext bc){
        return Container(
          height: MediaQuery.of(context).size.height ,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          "Filtro", style: TextStyle(fontSize: 20, color: Color(0xFF000080), fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkResponse(
                              splashFactory: InkRipple.splashFactory,
                              child: Container(
                                child:Icon(
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
                                child:Text(
                                  "Reset", style: TextStyle(color: Color(0xFF625F5F), fontSize: 16),
                                )
                              ),
                              onTap: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    //padding: const EdgeInsets.all(4.0),
                    margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    child: Text(
                      'Nome do Software',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          height: 45,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
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
                              autofocus: true,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16.0,
                                height: 1.5
                              ),
                              decoration: new InputDecoration(
                                hintText: "Digite o nome do equipamento",
                               enabledBorder: new OutlineInputBorder(
                                 borderSide: BorderSide(color: Colors.transparent, ),
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
                              'Categoria',
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
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Color(0xFFE0DFDF),
                                width: 2,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: Icon(Icons.keyboard_arrow_down),
                              //  value: filter["troubleType"],
                                hint: Text(
                                  'Escolha um tipo de problema',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45,
                                  ),
                                ),
                                isExpanded: true,
                                onChanged: (String newValue) {
                                 // updatePreferences(() {
                                 //   filter["troubleType"] = newValue;
                                 // });
                                },
                                items: <String>[
                                  'Tipo de Problema 1',
                                  'Tipo de Problema 2',
                                  'Tipo de Problema 3',
                                  'Tipo de Problema 4'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
  );
}

}