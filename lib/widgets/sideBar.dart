import 'package:comunica_mobile/models/ticket.dart';
import 'package:comunica_mobile/pages/Laboratory/bloc/filterlaboratory_bloc.dart';
import 'package:comunica_mobile/pages/Laboratory/bloc/lablist_bloc.dart';
import 'package:comunica_mobile/pages/Laboratory/lab.dart';
import 'package:comunica_mobile/pages/Laboratory/labList.dart';
import 'package:comunica_mobile/pages/UserTicket/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:comunica_mobile/pages/UserTicket/userTicket.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final headerTextStyle = TextStyle(color: Color(0xFFFFFFFF), fontSize: 14.0);

Widget handlerSideBar(BuildContext context) {
  return ListTileTheme(
    iconColor: Color(0xFF000080),
    child: Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Exemplo"),
              margin: EdgeInsets.all(0.0),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color(0xFFFFFFFF),
                child: Icon(Icons.person_outline,
                    color: Color(0xFF000080), size: 64),
              ),
              accountEmail: Text('email@email.com', style: headerTextStyle),
              onDetailsPressed: () {},
            ),
            ListTile(
              //SOMENTE PARA DEBUG , Quando der o OnTap em algum dos chamados da lista, usar esse bloc Provider e receber o ticket ja carregado
              title:
                  Text('Chamado', style: TextStyle(color: Color(0xFF6A5ACD))),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return BlocProvider(
                    create: (BuildContext context) => UserTicketBloc()
                      ..add(GetUserTicketEvent(ticket: response)),
                    child: UserTicket(),
                  );
                }));
              },
            ),
            ExpansionTile(
              title: Text('Software'),
              leading: Icon(Icons.directions_subway),
              children: <Widget>[
                ListTile(
                  title: Text('Cadastrar software',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Listar softwares',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Cadastrar categorias',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Listar categorias',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Registrar instalação',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Ver instalações',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {},
                )
              ],
            ),
            ExpansionTile(
              title: Text('Equipamento'),
              leading: Icon(Icons.directions_subway),
              children: <Widget>[
                ListTile(
                  title: Text('Cadastrar equipamento',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Listar equipamentos',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Cadastrar categorias',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {},
                ),
                ListTile(
                  title: Text('Listar categorias',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {},
                )
              ],
            ),
            ExpansionTile(
              title: Text('Laboratório'),
              leading: Icon(Icons.directions_subway),
              children: <Widget>[
                ListTile(
                  title: Text('Cadastrar laboratório',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) =>
                    //         LabList()));
                  },
                ),
                ListTile(
                  title: Text('Listar laboratórios',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider<LablistBloc>(
                            create: (BuildContext context) => LablistBloc(),
                          ),
                          BlocProvider<FilterlaboratoryBloc>(
                            create: (BuildContext context) =>
                                FilterlaboratoryBloc(),
                          ),
                        ],
                        child: LabList(),
                      );
                    }));
                  },
                )
              ],
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.directions_subway),
              title: Text('Logout'),
              onTap: () => _handleLogout(context),
            )
          ],
        ),
      ),
    ),
  );
}

void _handleLogout(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tem certeza que deseja sair desta sessão?'),
          content: Text('Sua sessão com este usuário será encerrada.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Sim'),
              textColor: Color(0xFF000080),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Não'),
              textColor: Color(0xFF000080),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}

//DEBUG Simulando pegar um ticket da lista
Ticket response = Ticket(
  id: 1,
  title: "Problema no Teclado",
  requestingUser: "Fulano da Silva Santos",
  category: "Hardware",
  type: "Tipo de Problema 3",
  description: "Teclado não funciona nas teclas Esc e enter. ",
  dateTime: DateTime.now(),
  status: "Pendente",
  likes: 200,
  dislikes: 30,
  liked: 'S',
);
