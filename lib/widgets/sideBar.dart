import 'package:comunica_mobile/pages/Calls/bloc/callList_bloc.dart';
import 'package:comunica_mobile/pages/Calls/bloc/callList_event.dart';
import 'package:comunica_mobile/pages/Calls/listComments.dart';
import 'package:comunica_mobile/pages/Images/comentarioTela.dart';
import 'package:comunica_mobile/pages/Laboratory/addLabImage.dart';
import 'package:comunica_mobile/pages/Laboratory/bloc/addLabImage_bloc.dart';
import 'package:comunica_mobile/pages/Laboratory/bloc/ticketCardLaboryImage_bloc.dart';
import 'package:comunica_mobile/pages/Software/bloc/filterBottomSheetAddSoftware_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/pages/Images/addToEquipment.dart';
import 'package:comunica_mobile/pages/Images/bloc/addtoequipment_bloc.dart';
import 'package:comunica_mobile/pages/Images/bloc/addtoequipment_event.dart';
import 'package:comunica_mobile/pages/Images/imagesList.dart';
import 'package:comunica_mobile/pages/Software/bloc/software_bloc.dart';
import 'package:comunica_mobile/pages/Software/software.dart';
import 'package:comunica_mobile/pages/Equipment/resources/bloc/imgSoftList_bloc.dart';
import 'package:comunica_mobile/pages/Equipment/resources/imgSoftList.dart';
import 'package:comunica_mobile/pages/Equipment/tickets/ticketList/bloc/bloc.dart';
import 'package:comunica_mobile/pages/Equipment/tickets/ticketList/equipmentTicketList.dart';
import 'package:comunica_mobile/pages/UserTicket/bloc/bloc.dart';
import 'package:comunica_mobile/pages/UserTicket/userTicketList.dart';
import 'package:comunica_mobile/pages/Laboratory/bloc/lablist_bloc.dart';
import 'package:comunica_mobile/pages/Laboratory/labList.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/bloc/customBottomNavigationBar_bloc.dart';

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
                child: Icon(
                  Icons.person_outline,
                  color: Color(0xFF000080),
                  size: 64,
                ),
              ),
              accountEmail: Text(
                'email@email.com',
                style: headerTextStyle,
              ),
              onDetailsPressed: () {},
            ),
            ListTile(
                leading:
                    Icon(CustomIcons.running_repair_man_with_wrench_and_kit),
                title: Text('Chamados'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider<UserTicketListBloc>(
                          create: (BuildContext context) =>
                              UserTicketListBloc()..add(FetchUserTickets()),
                        ),
                        BlocProvider<CustomBottomNavigationBarBloc>(
                          create: (BuildContext context) =>
                              CustomBottomNavigationBarBloc(),
                        ),
                      ],
                      child: UserTicketList(),
                    );
                  }));
                }),
            ListTile(
              leading: Icon(CustomIcons.aplicativo),
              title: Text('Imagem e Software'),
              onTap: () {
                //new feature
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return ImagesList();
                  }),
                );
              },
            ),
            ExpansionTile(
              title: Text('Software'),
              leading: Icon(Icons.directions_subway),
              children: <Widget>[
                ListTile(
                  title: Text('Cadastrar software',
                      style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return /*MultiBlocProvider(
                            providers: [
                              BlocProvider<SoftwareBloc>(
                                create: (_) => SoftwareBloc(),
                              ),
                              BlocProvider<FilterBottomSheet_Bloc>(
                                create: (_) => FilterBottomSheet_Bloc(),
                              )
                            ],
                            child:  Software(),
                          );*/

                          BlocProvider<SoftwareBloc>(
                              create: (_) => SoftwareBloc(), child: Software());
                    }));
                  },
                ),
                ListTile(
                  title: Text(
                    'Listar softwares',
                    style: TextStyle(
                      color: Color(0xFF6A5ACD),
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Cadastrar categorias',
                    style: TextStyle(
                      color: Color(0xFF6A5ACD),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider<CallListBloc>(
                            create: (BuildContext context) =>
                                CallListBloc()..add(FetchCalls()),
                          ),
                        ],
                        child: ListComments(),
                      );
                    }));
                  },
                ),
                ListTile(
                  title: Text(
                    'Listar categorias',
                    style: TextStyle(
                      color: Color(0xFF6A5ACD),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider<CallListBloc>(
                            create: (BuildContext context) =>
                                CallListBloc()..add(FetchCalls()),
                          ),
                        ],
                        child: comentarioTela(),
                      );
                    }));
                  },
                ),
                ListTile(
                  title: Text(
                    'Registrar instalação',
                    style: TextStyle(
                      color: Color(0xFF6A5ACD),
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Ver instalações',
                    style: TextStyle(color: Color(0xFF6A5ACD)),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return MultiBlocProvider(
                          providers: [
                            BlocProvider<ImgSoftListBloc>(
                                create: (BuildContext context) =>
                                    ImgSoftListBloc()),
                            BlocProvider<CustomBottomNavigationBarBloc>(
                              create: (BuildContext context) =>
                                  CustomBottomNavigationBarBloc(),
                            ),
                          ],
                          child: ImgSoftList(),
                        );
                      }),
                    );
                  },
                )
              ],
            ),
            ExpansionTile(
              title: Text('Equipamento'),
              leading: Icon(Icons.directions_subway),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Cadastrar equipamento',
                    style: TextStyle(
                      color: Color(0xFF6A5ACD),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider<AddToEquipmentBloc>(
                                create: (BuildContext context) =>
                                    AddToEquipmentBloc()
                                      ..add(FetchEquipments()),
                              ),
                            ],
                            child: AddToEquipment(),
                          );
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Listar equipamentos',
                    style: TextStyle(
                      color: Color(0xFF6A5ACD),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return MultiBlocProvider(
                          providers: [
                            BlocProvider<CustomBottomNavigationBarBloc>(
                              create: (BuildContext context) =>
                                  CustomBottomNavigationBarBloc(),
                            ),
                            BlocProvider<EquipmentTicketListBloc>(
                              create: (BuildContext context) =>
                                  EquipmentTicketListBloc()
                                    ..add(FetchEquipmentTickets()),
                            ),
                          ],
                          child: TicketList(),
                        );
                      }),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Cadastrar categorias',
                    style: TextStyle(
                      color: Color(0xFF6A5ACD),
                    ),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Listar categorias',
                    style: TextStyle(
                      color: Color(0xFF6A5ACD),
                    ),
                  ),
                  onTap: () {},
                )
              ],
            ),
            ExpansionTile(
              title: Text('Laboratório'),
              leading: Icon(Icons.directions_subway),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Cadastrar laboratório',
                    style: TextStyle(
                      color: Color(0xFF6A5ACD),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider<AddLabImage_Bloc>(
                            create: (_) => AddLabImage_Bloc(),
                          ),
                          BlocProvider<TicketCardLaboryImage_bloc>(
                            create: (_) => TicketCardLaboryImage_bloc(),
                          )
                        ],
                        child: AddLabImage(),
                      );
                    }));
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) =>
                    //         LabList()));
                  },
                ),
                ListTile(
                  title: Text(
                    'Listar laboratórios',
                    style: TextStyle(
                      color: Color(0xFF6A5ACD),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MultiBlocProvider(
                        providers: [
                          BlocProvider<LablistBloc>(
                            create: (BuildContext context) => LablistBloc(),
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
