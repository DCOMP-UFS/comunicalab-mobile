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
        final _snackBar = SnackBar(content: Text('Não foi permitido acesso a câmera!'));
        Scaffold.of(context).showSnackBar(_snackBar);
      } else {
        _barcode = 'Erro desconhecido: $e';
      }
    } on FormatException{ //Usuário cancelou a leitura
      _barcode = '';
    } catch (e) {
      _barcode = 'Erro desconhecido: $e';
    }
    return _barcode;
  }

  Widget qrNav(BuildContext context){
    return IconTheme(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              child: Container(
                width: 160,
                height: 32,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color(0xFF000080),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(CustomIcons.enter),
                    Text(
                      "           Login",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                String _barcode = await scan(context);
                if(_barcode != ''){
                  BlocProvider.of<QrBloc>(context).add(Login(code: _barcode));
                }
              },
            ),
            GestureDetector(
              child: Container(
                width: 160,
                height: 32,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color(0xFF000080),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(CustomIcons.magnifier_with_an_eye),
                    Text(
                      "  Ver informações",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () async {
                String _barcode = await scan(context);
                if(_barcode != ''){
                  BlocProvider.of<QrBloc>(context).add(Login(code: _barcode));
                }
              },
            ),
          ],
        ),
      ),
      data: IconThemeData(
        color: Color(0xFFFFFFFF)
      ),
    );
  }

  Widget qrReader(BuildContext context){
    return Center(
      child: BlocBuilder<QrBloc, QrState>(
        builder: (context, state) {
          if(state is InitialQrState){
            return Container(
              padding: EdgeInsets.all(72),
              child: Icon(CustomIcons.qr_code, size: 200,)
            );
          } else {
            return Text(state.code);
          }
        },
      )
    );
  }

  Widget notification(){
    int _value = 20;
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(CustomIcons.notification),
          onPressed: (){},
        ),
        _value != 0 ? new Positioned(
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
        ) : new Container()
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: Builder( //Usando builder para passar o contexto correto para o openDrawer
            builder: (context){
              return IconButton(
                icon: Icon(CustomIcons.ajuda),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Text("Início"),
          actions: <Widget>[
            notification()
          ],
        ),
        drawer: handlerSideBar(context),
        bottomNavigationBar: Builder(
          builder: (context){
            return qrNav(context);
          }
        ),
        body: qrReader(context),
      ),
    );
  }
}