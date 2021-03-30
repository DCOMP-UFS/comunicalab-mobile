import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/widgets/commomNavigator.dart';
import 'package:flutter/material.dart';

class LabPage extends StatefulWidget {
  @override
  _LabPageState createState() => _LabPageState();
}

class _LabPageState extends State<LabPage> {
  //Integrar com o back para fornecer os dados do laboratorio
  static final labData = {"id":1,"name":"Lab 1","location":"Universidade Federal de Sergipe","status":"Disponível","capacity":30,"isDeleted":false,"active":true};

  static const List<Icon> _icons = [
    Icon(CustomIcons.running_repair_man_with_wrench_and_kit),
    Icon(CustomIcons.aplicativo), //Mudar para o correto depois
    Icon(CustomIcons.computador),
  ];

  static const TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 18);
  static const TextStyle subtitleStyle = TextStyle(color: Colors.white, fontSize: 12);
  static List<Widget> _titles = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Abrir Chamado", style: titleStyle),
        Text(labData['name'], style: subtitleStyle),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Lista de Chamados", style: titleStyle),
        Text(labData['name'], style: subtitleStyle),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Listar Equipamentos", style: titleStyle),
        Text(labData['name'], style: subtitleStyle),
      ],
    ),  
    Text(labData['name'], style: titleStyle,),
  ];

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _options = <Widget>[ //Colocar aqui nessa lista os widgets referentes a tela de exibir um laboratório.
    Center(
      child: Text(
        'Index 0: Abrir chamado',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Index 1: Lista de chamados',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Index 2: Listar equipamentos',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Index 3: HomePage',
        style: optionStyle,
      ),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return CommomNavigator(options: _options, icons: _icons, titles: _titles,);  //Widget para gerar uma tela com botões e widgets cutomizados
  }
}
