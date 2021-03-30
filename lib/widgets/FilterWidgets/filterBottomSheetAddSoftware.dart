import 'package:comunica_mobile/pages/Software/bloc/filterBottomSheetAddSoftware_bloc.dart';
import 'package:comunica_mobile/pages/Software/bloc/filterBottomSheetAddSoftware_event.dart';
import 'package:comunica_mobile/pages/Software/bloc/filterBottomSheetAddSoftware_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



// ignore: must_be_immutable
class FilterBottomSheetAddSoftware extends StatelessWidget{

  String _dropDown;

  TextEditingController _textControl = new TextEditingController();
 // FilterBottomSheet_Bloc bloc;

  //FilterBottomSheetAddSoftware({@required this.bloc});

  @override
  Widget build(BuildContext context) {
    return modalBottomSheet(context);
    
  }

   modalBottomSheet(BuildContext context){
     BuildContext _context1;
   showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0)
        )
      ),
      context: context,
      builder: (BuildContext bc){
        return BlocProvider<FilterBottomSheet_Bloc>(
            create:(_) => FilterBottomSheet_Bloc(),
            child: Container(
              height: MediaQuery.of(context).size.height ,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BlocBuilder<FilterBottomSheet_Bloc, FilterBottomSheet_state>(
                    builder: (context, state) {
                      return Column(
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
                                                "Limpar", style: TextStyle(color: Color(0xFF625F5F), fontSize: 16),
                                              ),
                                          ),
                                      onTap: () {
                                        _textControl.clear();
                                        _dropDown = null;
                                        BlocProvider.of<FilterBottomSheet_Bloc>(context).add(CategoryEvent(_dropDown));
                                      },
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
                                  padding: EdgeInsets.only(top: 18),
                                  height: 45,
                                  //alignment: Alignment.centerLeft,
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
                                      controller: _textControl,
                                      autofocus: false,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16.0,
                                          height: 1.5
                                      ),
                                      decoration: new InputDecoration(
                                        hintText: "Digite o nome do software",
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
                                          child: DropdownButton(
                                            value: _dropDown,
                                            icon: Icon(Icons.keyboard_arrow_down),
                                            onChanged: (String newValue){
                                              _dropDown = newValue;
                                              BlocProvider.of<FilterBottomSheet_Bloc>(context).add(CategoryEvent(_dropDown));
                                            },
                                            hint: Text(
                                              "Selecione uma Categoria", style: TextStyle(
                                                fontSize: 16.0, color: Colors.black45
                                            ),
                                            ),
                                            items: <String> ["Categoria 1", "Categoria 2", "Categoria 3", "Categoria 4"]
                                                .map<DropdownMenuItem<String>>(( String value){
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),

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
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ),
              ),
            ),
        );
      }
  );
}

}