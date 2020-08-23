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
  @override
  Widget build(BuildContext context) {
    final mediaq = MediaQuery.of(context);
    final size = mediaq.size;
    final screenWidth = size.width * mediaq.devicePixelRatio;
    final screenHeight = size.height * mediaq.devicePixelRatio;

    double percentage1 = 0.05;
    double percentage2 = 0.005;

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
                    height: screenHeight * percentage2,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: screenHeight * percentage1),
                    child: screenWidth > 700
                        ? Text(
                            'Adicionar Softwares',
                            style: TextStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                            softWrap: true,
                            maxLines: 2,
                          )
                        : Text(
                            'Adicionar Softwares',
                            style: TextStyle(fontSize: 8),
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
                    height: screenHeight * percentage2,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: screenHeight * percentage1),
                    child: screenWidth > 700
                        ? Text(
                            'Adicionar à Equipamentos',
                            style: TextStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            softWrap: true,
                          )
                        : Text(
                            'Adicionar à Equipamentos',
                            style: TextStyle(fontSize: 8),
                            textAlign: TextAlign.center,
                            maxLines: 2,
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
                    height: screenHeight * percentage2,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: screenHeight * percentage1),
                    child: screenWidth > 700
                        ? Text(
                            'Adicionar à Laboratorios',
                            style: TextStyle(fontSize: 13),
                            textAlign: TextAlign.center,
                            softWrap: true,
                            maxLines: 2,
                          )
                        : Text(
                            'Adicionar à Laboratorios',
                            style: TextStyle(fontSize: 8),
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