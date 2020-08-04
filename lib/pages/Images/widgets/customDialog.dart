import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/pages/Images/addToEquipment.dart';
import 'package:comunica_mobile/pages/Images/bloc/bloc.dart';
import 'package:comunica_mobile/pages/Laboratory/addLabImage.dart';
import 'package:comunica_mobile/pages/Laboratory/bloc/addLabImage_bloc.dart';
import 'package:comunica_mobile/pages/Software/bloc/software_bloc.dart';
import 'package:comunica_mobile/pages/Software/software.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDialog extends StatelessWidget {
  double altura = 35;

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
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                        return BlocProvider<SoftwareBloc>(create: (_) => SoftwareBloc(), child: Software());
                      }));
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF000080),
                      child: Icon(
                        CustomIcons.aplicativo,
                        color: Colors.white,
                        size: 45,
                      ),
                      radius: 40,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: altura),
                    child: Text(
                      'Adicionar Softwares',
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
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
                        CustomIcons.computador,
                        color: Colors.white,
                        size: 45,
                      ),
                      radius: 40,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: altura),
                    child: Text(
                      'Adicionar à Equipamentos',
                      style: TextStyle(fontSize: 13),
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
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return MultiBlocProvider(
                              providers: [
                                BlocProvider<AddLabImage_Bloc>(
                                  create: (BuildContext context) => AddLabImage_Bloc(),
                                ),
                              ],
                              child: AddLabImage(),
                            );
                          },
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF000080),
                      child: Icon(
                        CustomIcons.door,
                        color: Colors.white,
                        size: 45,
                      ),
                      radius: 40,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: altura),
                    child: Text(
                      'Adicionar à Laboratorios',
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                    ),
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
