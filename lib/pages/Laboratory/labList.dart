import 'dart:async';

import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/pages/Laboratory/bloc/bloc.dart';
import 'package:comunica_mobile/widgets/ListTicket/listTicket.dart';
import 'package:comunica_mobile/widgets/FilterWidgets/filterBottomSheetAddLaboratory.dart';
import 'package:comunica_mobile/widgets/errorWidget.dart';
import 'package:comunica_mobile/widgets/loadingWidget.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lab.dart';

//O filtro utilizado é o mesmo utilizado na tela de cadastrar laboratorio, logo não há necessidade de criar outro arquivo para filtros

class LabList extends StatefulWidget {
  @override
  _LabListState createState() => _LabListState();
}

class _LabListState extends State<LabList> {
  @override
  void initState() {
    BlocProvider.of<LablistBloc>(context).add(FetchLabsList());
    super.initState();
  }

  @override
  void dispose() {
    textType.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LablistBloc, LablistState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
              title: Text("Lista de Laboratórios", style: titleStyle),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    if (state is LabListSuccess) {
                      //FilterBottomSheetAddLaboratory().build(context);
                      filterBottomSheetLaboratory(
                              context: context,
                              name: state.filter['state'],
                              location: state.filter['location'],
                              status: state.filter['status'])
                          .then((filter) {
                        BlocProvider.of<LablistBloc>(context)
                            .add(ApplyFilterLab(filter));
                        print(filter);
                      });
                    }
                  },
                )
              ]),
          drawer: handlerSideBar(context),
          body: SafeArea(
              child: state is LabsListLoading
                  ? LoadingWidget(message: "Carregando laboratórios...")
                  : state is LabListSuccess
                      ? ListView.builder(
                          itemCount: state?.labsList?.length,
                          itemBuilder: (context, index) {
                            return labCard(context, state.labsList[index]);
                          },
                        )
                      : ErrorMessageWidget(
                          message: "Houve um erro ao carregar a lista.",
                        )));
    });
  }
}

Widget labCard(BuildContext context, Map labData) {
  return Stack(
    children: <Widget>[
      Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.fromLTRB(57, 12, 57, 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(labData['name'],
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500)),
                Text(labData['location_id'].toString(),
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight:
                            FontWeight.normal)), //TODO integrar com backend
                labStatusRow(labData),
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => LabPage(),
                settings: RouteSettings(arguments: labData)));
          },
        ),
      ),
      Divider(
        height: 2,
        thickness: 1,
        color: Color.fromRGBO(0, 0, 128, 0.3),
      ),
    ],
  );
}

List<Color> labStatusColor = [
  Color(0xFFFF0000),
  Color(0xFF00FF29),
  Color(0xFFFFF500)
];
List<String> labStatusText = ['  Ocupado', '  Livre', '  Reservado'];

Widget labStatusRow(Map labData) {
  var _status = labData['is_in_use']
      ? 0
      : labData['occupied_at'] == null
          ? 1
          : 2; //0 é ocupado, 1 é livre e 2 é reservado
  return Container(
    padding: EdgeInsets.fromLTRB(0, 10, 0, 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: labStatusColor[_status]),
              width: 16,
              height: 16,
            ),
            Text(labStatusText[_status], style: TextStyle(fontSize: 11)),
          ],
        ),
        _status == 2
            ? labTimeRow(DateTime.parse(labData['occupied_at']))
            : Center(),
      ],
    ),
  );
}

Widget labTimeRow(DateTime date) {
  return Row(
    children: <Widget>[
      Icon(Icons.watch_later_outlined, size: 16),
      Text(
          "  ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}",
          style: TextStyle(fontSize: 11)),
    ],
  );
}
