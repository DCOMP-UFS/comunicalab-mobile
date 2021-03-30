import 'package:barcode_scan/barcode_scan.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'bloc/bloc.dart';
import 'package:comunica_mobile/icons/custom_icons_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future scan(BuildContext context) async {
    String _barcode;
    try {
      _barcode = await BarcodeScanner.scan();
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        _barcode = '';
        final _snackBar =
            SnackBar(content: Text('Não foi permitido acesso a câmera!'));
        Scaffold.of(context).showSnackBar(_snackBar);
      } else {
        _barcode = 'Erro desconhecido: $e';
      }
    } on FormatException {
      //Usuário cancelou a leitura
      _barcode = '';
    } catch (e) {
      _barcode = 'Erro desconhecido: $e';
    }
    return _barcode;
  }

  Widget qrNav2(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) async {
        switch (index) {
          case 0:
            String _barcode = await scan(context);
            if (_barcode != '') {
              BlocProvider.of<QrBloc>(context).add(Login(code: _barcode));
            }
            break;
          case 1:
            String _barcode = await scan(context);
            if (_barcode != '') {
              BlocProvider.of<QrBloc>(context).add(Login(code: _barcode));
            }
        }
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            CustomIcons.enter,
            color: Color(0xFF000080),
          ),
          title: SizedBox.shrink(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CustomIcons.search,
            color: Color(0xFF000080),
          ),
          title: SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget qrNav(BuildContext context) {
    return IconTheme(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(CustomIcons.enter),
              color: Color(0xFF000080),
              onPressed: () async {
                String _barcode = await scan(context);
                if (_barcode != '') {
                  BlocProvider.of<QrBloc>(context).add(Login(code: _barcode));
                }
              },
            ),
            IconButton(
              icon: Icon(CustomIcons.search),
              color: Color(0xFF000080),
              onPressed: () async {
                String _barcode = await scan(context);
                if (_barcode != '') {
                  BlocProvider.of<QrBloc>(context).add(Login(code: _barcode));
                }
              },
            ),
          ],
        ),
      ),
      data: IconThemeData(color: Color(0xFFFFFFFF)),
    );
  }

  Widget qrReader(BuildContext context) {
    return Center(child: BlocBuilder<QrBloc, QrState>(
      builder: (context, state) {
        if (state is InitialQrState) {
          return Container(
              padding: EdgeInsets.all(72),
              child: Icon(
                CustomIcons.qr_code,
                size: 200,
              ));
        } else {
          return Text(state.code);
        }
      },
    ));
  }

  Widget notification() {
    int _value = 20;
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(CustomIcons.notification),
          onPressed: () {},
        ),
        _value != 0
            ? new Positioned(
                right: 11,
                top: 11,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$_value',
                    style: TextStyle(
                      color: Color(0xFF000080),
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : new Container()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            //Usando builder para passar o contexto correto para o openDrawer
            builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Text("Início"),
          actions: <Widget>[notification()],
        ),
        drawer: handlerSideBar(context),
        bottomNavigationBar: qrNav2(context),
        body: qrReader(context),
      ),
    );
  }
}
