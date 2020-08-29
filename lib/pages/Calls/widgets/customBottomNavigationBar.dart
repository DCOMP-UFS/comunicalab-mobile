import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/bloc/customBottomNavigationBar_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.height;

    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 14,
      selectedItemColor: Color(0xFF4B8CED),
      unselectedFontSize: 14,
      unselectedItemColor: Color(0xFF000080),
      onTap: (s) {},
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            CustomIcons.allcoments,
            size: width * 0.08,
          ),
          title: Text('Comentários'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CustomIcons.meuscomentarios,
            size: width * 0.08,
          ),
          title: Text('Meu Comentário'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CustomIcons.fazercomentario,
            size: width * 0.08,
          ),
          title: Text('Fazer Comentário'),
        ),
      ],
    );
  }
}
