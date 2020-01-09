import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/widgets/CommomNavigator/commomNavigator.dart';
import 'package:comunica_mobile/widgets/ListTicket/bloc/bloc.dart';
import 'package:comunica_mobile/widgets/ListTicket/listTicket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/LaboratoryWidgets/lab_detail_screen.dart';
import '../../widgets/LaboratoryWidgets/lab_call_screen.dart';

class LabPage extends StatefulWidget {
  @override
  _LabPageState createState() => _LabPageState();
}

class _LabPageState extends State<LabPage> {

  static const List<Icon> _icons = [
    Icon(CustomIcons.running_repair_man_with_wrench_and_kit),
    Icon(CustomIcons.aplicativo), //Mudar para o correto depois
    Icon(CustomIcons.computador),
  ];

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 18);
  static const TextStyle subtitleStyle = TextStyle(color: Colors.white, fontSize: 12);


  @override
  Widget build(BuildContext context) {
    Map labData = ModalRoute.of(context).settings.arguments; //Dados do laboratório estão nessa variável
    
    List<AppBar> _titles = [
      AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Abrir Chamado", style: titleStyle),
            Text(labData['name'], style: subtitleStyle),
          ],
        ),
      ),
      listTicketAppbar(labData),
      AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Listar Equipamentos", style: titleStyle),
            Text(labData['name'], style: subtitleStyle),
          ],
        ),
      ),
      AppBar(
        title: Text(labData['name'], style: titleStyle),
      ),
    ];


    List<Widget> _options = <Widget>[ //Colocar aqui nessa lista os widgets referentes a tela de exibir um laboratório.
      //Tela de Abrir Chamados de Laboratório
      LabCallScreen(labData),

      //Tela de Listagem de Chamados do Laboratório
      listTicketBody(labData),

      //Tela de Listagem de Equipamentos do Laboratório
      Center(
        child: Text(
          'Index 2: Listar equipamentos',
          style: optionStyle,
        ),
      ),

      //Tela de Informações Básicas do Laboratório
      LabDetailScreen(labData),
    ];

    return BlocProvider(
      create: (context) => FilterticketBloc(),
      child: CommomNavigator(options: _options, icons: _icons, titles: _titles),  //Widget para gerar uma tela com botões e widgets cutomizados
    );
  }
}