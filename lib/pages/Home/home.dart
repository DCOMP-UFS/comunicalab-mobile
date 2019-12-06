import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  final headerTextStyle = TextStyle(color: Color(0xFFFFFFFF), fontSize: 14.0);

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
                  Navigator.of(context).pop();},
              ),
              FlatButton(
                child: Text('Não'),
                textColor: Color(0xFF000080),
                onPressed: () {Navigator.of(context).pop();},
              )
            ],
          );
        });

  }

  Widget handlerSideBar(BuildContext context){
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Exemplo"),
              margin: EdgeInsets.all(0.0),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color(0xFFFFFFFF),
                child: Icon(Icons.person_outline,
                    color: Color(0xFF000080),
                    size: 64),
              ),
              accountEmail: Text('email@email.com', style: headerTextStyle),
              onDetailsPressed: (){},
            ),
            ExpansionTile(
              title: Text('Software'),
              leading: Icon(Icons.directions_subway),
              children: <Widget>[
                ListTile(
                  title: Text('Cadastrar software', style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Listar softwares', style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Cadastrar categorias', style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Listar categorias', style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Registrar instalação', style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Ver instalações', style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: (){},
                )
              ],
            ),
            ExpansionTile(
              title: Text('Equipamento'),
              leading: Icon(Icons.directions_subway),
              children: <Widget>[
                ListTile(
                  title: Text('Cadastrar equipamento', style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Listar equipamentos', style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Cadastrar categorias', style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: (){},
                ),
                ListTile(
                  title: Text('Listar categorias', style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: (){},
                )
              ],
            ),
            ExpansionTile(
              title: Text('Laboratório'),
              leading: Icon(Icons.directions_subway),
              children: <Widget>[
                ListTile(
                  title: Text('Cadastrar laboratório', style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: (){
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) =>
                    //         CriarLaboratorioModule()));
                  },
                ),
                ListTile(
                  title: Text('Listar laboratórios', style: TextStyle(color: Color(0xFF6A5ACD))),
                  onTap: (){
                  },
                )
              ],
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.directions_subway),
              title: Text('Logout'),
              onTap: () => _handleLogout(context),
            )
          ],
        ),
      ),
    );
  }


  Widget qrNav(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.redo),
          onPressed: () async {
            String _barcode = await BarcodeScanner.scan();//tratar de erros dps
            BlocProvider.of<QrBloc>(context).add(Login(code: _barcode));
          },
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () async {
            String _barcode = await BarcodeScanner.scan();//tratar de erros dps
            BlocProvider.of<QrBloc>(context).add(Search(code: _barcode));
          },
        ),
      ],
    );
  }

  Widget qrReader(BuildContext context){
    return Center(
      child: BlocBuilder<QrBloc, QrState>(
        builder: (context, state) {
          if(state is InitialQrState){
            return Container(
              padding: EdgeInsets.all(72),
              child: Image.network(
                "https://s3-alpha-sig.figma.com/img/19ba/493e/b71e8f32e8863f51c3652adfe967aa84?Expires=1576454400&Signature=In3wOT8N2eNN0zpsBrImUIGu32DUzBMrL8t4k4~U8o0-GP3z8XJ3q71Q9dJ4NnPLepq1XgShQw6sy9wwVB12eS-efiAgnhwxn2wYi2IN4vV1cLYBc-KQIq8FMEHQlPwXfwf8t0TeOVQw~TwbvdrkjDI~Puzaoeb6vxgAlu5hNpF~XllK8WdoVAfM9eL7t7iFi9at-vMSKvrfFAgwv~7xatoslKCClmznGjlfLycTe-V-KRf8OT254~VeyYfTVi9NFrijozKoD7kfljpIW7Uv~Y5G-NFYd2Ys1ZmQ9ugUlbv2Jox7nIgHMyFGXLWTOFjWCGin1~7AatMeiyTxwqxU~g__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                color: Colors.black,
              ),
            );
          } else {
            return Text(state.code);
          }
        },
      )
    );
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Início"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: (){},
            )
          ],
        ),
        drawer: ListTileTheme(
          iconColor: Color(0xFF000080),
          child: handlerSideBar(context)
        ),
        bottomNavigationBar: qrNav(context),
        body: qrReader(context),
      ),
    );
  }
}