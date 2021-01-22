import 'package:comunica_mobile/pages/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/Home/bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Comunica-lab',
        theme: ThemeData(
            primaryColor: Color(0xFF000080),
            fontFamily: 'Roboto',
            textTheme:
                TextTheme(subtitle1: TextStyle(color: Color(0xFF000080))),
            unselectedWidgetColor: Color(0xFF000080),
            dialogTheme: DialogTheme(
                contentTextStyle: TextStyle(color: Color(0xFF4F4F4F))),
            inputDecorationTheme: InputDecorationTheme(
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: Color(0xFF000080), width: 2.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: Color(0xFF000080), width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: Color(0xFF000080), width: 2.0))),
            appBarTheme: AppBarTheme(color: Color(0xFF000080)),
            primaryIconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
            primaryTextTheme: Theme.of(context)
                .primaryTextTheme
                .apply(bodyColor: Color(0xFFFFFFFF)),
            accentTextTheme: Theme.of(context)
                .primaryTextTheme
                .apply(bodyColor: Color(0xFF000080))),
        home: MultiBlocProvider(
          //Conforme surgir a necessidade, adicionar blocProviders aqui
          providers: [
            BlocProvider<QrBloc>(
              create: (context) => QrBloc(),
            ),
          ],
          child:
              HomePage(), //Depois alterar para direcionar para a tela de login
        ));
  }
}
