import 'package:comunica_mobile/pages/Images/addToEquipment.dart';
import 'package:comunica_mobile/pages/Images/bloc/bloc.dart';
import 'package:comunica_mobile/pages/Software/bloc/software_bloc.dart';
import 'package:comunica_mobile/pages/Software/software.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Opções',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context){
                          return BlocProvider<SoftwareBloc>(
                              create: (_) => SoftwareBloc(),
                              child: Software()
                          );
                        }
                    )
                    );
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF000080),
                      child: Icon(
                        Icons.smartphone,
                        color: Colors.white,
                        size: 45,
                      ),
                      radius: 40,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Adicionar Softwares',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 2,
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider<AddToEquipmentBloc>(
                                create: (BuildContext context) => AddToEquipmentBloc()..add(FetchEquipments()),
                              ),
                            ],
                            child: AddToEquipment(),
                          );
                        },
                      ),
                    );
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF000080),
                      child: Icon(
                        Icons.computer,
                        color: Colors.white,
                        size: 45,
                      ),
                      radius: 40,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      'Adicionar à Equipamentos',
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      softWrap: true,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF000080),
                      child: Icon(
                        Icons.note,
                        color: Colors.white,
                        size: 45,
                      ),
                      radius: 40,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Adicionar à Laboratorios',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 2,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
