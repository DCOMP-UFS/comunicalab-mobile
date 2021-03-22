import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/bloc/customBottomNavigationBar_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    return BlocBuilder<CustomBottomNavigationBarBloc, int>(
        builder: (context, index) {
      return BottomNavigationBar(
        currentIndex: index,
        //Recupera do BLoC a opção selecionada da Bottom Navigation Bar
        selectedItemColor: Color(0xFF4B8CED),
        unselectedItemColor: Color(0xFF000080),
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
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.running_repair_man_with_wrench_and_kit,
              size: width * 0.08,
            ),
            label: 'Abrir Chamado',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.ticket_magnifier,
              size: width * 0.08,
            ),
            label: 'Ver Chamados',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.computador,
              size: width * 0.08,
            ),
            label: 'Equipamentos',
          ),
        ],
      );
    });
  }
}
