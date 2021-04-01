import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/bloc/customBottomNavigationBar_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomBottomNavigationBarBloc, int>(
        builder: (context, index) {
      return BottomNavigationBar(
        currentIndex: index,
        //Recupera do BLoC a opção selecionada da Bottom Navigation Bar
        selectedItemColor: Color(0xFF000080),
        onTap: (newIndex) {
          switch (newIndex) {
            case 0:
              BlocProvider.of<CustomBottomNavigationBarBloc>(context)
                  .add(CustomBottomNavigationBarEvent.opcao1);
              break;
            case 1:
              BlocProvider.of<CustomBottomNavigationBarBloc>(context)
                  .add(CustomBottomNavigationBarEvent.opcao2);
              break;
            case 2:
              BlocProvider.of<CustomBottomNavigationBarBloc>(context)
                  .add(CustomBottomNavigationBarEvent.opcao3);
              break;
          }
        },
        items: <BottomNavigationBarItem>[
          //TODO:Receber como variaveis do widget os Icones a serem utilizadas e suas respectivas "labels " (title - nome depreceado), junto com as funções chamadas
          BottomNavigationBarItem(
            activeIcon: Container(
              width: 350,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF000080),
              ),
              child: Icon(
                CustomIcons.running_repair_man_with_wrench_and_kit,
                color: Colors.white,
              ),
            ),
            icon: Icon(
              CustomIcons.running_repair_man_with_wrench_and_kit,
              color: Color(0xFF000080),
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              width: 350,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF000080),
              ),
              child: Icon(
                CustomIcons.investigate,
                color: Colors.white,
              ),
            ),
            icon: Icon(
              CustomIcons.investigate,
              color: Color(0xFF000080),
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              width: 350,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF000080),
              ),
              child: Icon(
                CustomIcons.aplicativo,
                color: Colors.white,
              ),
            ),
            icon: Icon(
              CustomIcons.aplicativo,
              color: Color(0xFF000080),
            ),
            title: Container(),
          ),
        ],
      );
    });
  }
}
