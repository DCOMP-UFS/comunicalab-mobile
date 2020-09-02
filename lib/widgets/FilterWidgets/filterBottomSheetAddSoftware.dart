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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          autofocus: false,
                          style: TextStyle(color: Colors.black),
                          decoration: new InputDecoration(
                            hintText: "Digite o nome do equipamento",
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black26, width: 0.0),
                            ),
                            border: const OutlineInputBorder(),
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