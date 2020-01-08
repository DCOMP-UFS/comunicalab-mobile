import 'dart:async';

import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/pages/Laboratory/bloc/bloc.dart';
import 'package:comunica_mobile/widgets/ListTicket/listTicket.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lab.dart';


class LabList extends StatefulWidget {
  @override
  _LabListState createState() => _LabListState();
}

class _LabListState extends State<LabList> {
  TextEditingController controller = TextEditingController();
  StreamController textType = StreamController();


  @override
  void initState() {
    BlocProvider.of<LablistBloc>(context).add(LabListLoad());
    super.initState();
  }
  @override
  void dispose() {
    textType.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    controller.addListener((){
      textType.add(true);
    });
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<FilterlaboratoryBloc, FilterlaboratoryState>(
          builder: (context, state) {
            if (state is InitialFilterlaboratoryState) {
              return Text("Lista de Laboratórios", style: titleStyle);
            } else {
              if (state is ByStatus || state is ChoosingStatus) {
                return Text("Lista de Laboratórios", style: titleStyle);
              } else {
                return textBar(controller, state is ByName ? 'nome' : 'local');
              }
            }
          }
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: BlocBuilder<FilterlaboratoryBloc, FilterlaboratoryState>(
            builder: (context, state) {
              if (state is ChoosingStatus) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    statusButton("Livre", () => BlocProvider.of<FilterlaboratoryBloc>(context).add(ToStatus(status: "Livre"))),
                    statusButton("Reservado", () => BlocProvider.of<FilterlaboratoryBloc>(context).add(ToStatus(status: "Reservado"))),
                    statusButton("Ocupado", () => BlocProvider.of<FilterlaboratoryBloc>(context).add(ToStatus(status: "Ocupado"))),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    filterButton("Status", state is ByStatus, () {
                      BlocProvider.of<FilterlaboratoryBloc>(context).add(ToChooseStatus());
                      controller.clear();
                    }),
                    filterButton("Nome", state is ByName, () {
                      BlocProvider.of<FilterlaboratoryBloc>(context).add(ToName());
                      controller.clear();
                    }),
                    filterButton("Local", state is ByPlace, () {
                      BlocProvider.of<FilterlaboratoryBloc>(context).add(ToPlace());
                      controller.clear();
                    }),
                  ],
                );
              }
            },
          ),
        ),
      ),
      drawer: handlerSideBar(context),
      body: BlocBuilder<LablistBloc, LablistState>(
        builder: (context, state) {
          if (state is LabListSuccess) {
            return BlocBuilder<FilterlaboratoryBloc, FilterlaboratoryState>(
              builder: (context, filterState) {
                return StreamBuilder(
                  stream: textType.stream,
                  builder: (context, snapshot){
                    List<Map> labs = [];
                    if(filterState is ByName){
                      state.labs.forEach((lab){
                        if(lab['name'].contains(controller.text)) {
                          labs.add(lab);
                        }
                      });
                    } else {
                      if(filterState is ByPlace){
                        state.labs.forEach((lab){
                          if(lab['location_id'] != null && lab['location_id'].contains(controller.text)) { //TODO back não retorna location
                            labs.add(lab);
                          }
                        });
                      } else {
                        if (filterState is ByStatus) {
                          state.labs.forEach((lab){
                            if(lab['is_in_use'] && filterState.status == "Ocupado") { //TODO back não retorna status
                              labs.add(lab);
                            }
                          });
                        } else {
                          labs = state.labs;
                        }
                      }
                    }
                    return ListView.builder(
                      itemCount: labs.length,
                      itemBuilder: (context, index){
                        return labCard(context, labs[index]);
                      },
                    );
                  },
                );   
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator()
            );
          }
        },
      ),
    );
  }
}

GestureDetector filterButton(String text, bool status, Function onTap){
  Color _primaryColor = Color(0xFF000080);
  return GestureDetector(
    child: Container(
      width: 117,
      height: 30,
      margin: EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: status ? _primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: status ? 2 : 0,
          color: Colors.white,
        )
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: status ? Colors.white : _primaryColor,
            fontSize: 18
          ),
        ),
      ),
    ),
    onTap: () async {
      onTap();
    },
  );
}

Widget labCard(BuildContext context, Map labData){
  return Container(
    padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
    child: GestureDetector(
      child: Card(
        elevation: 5,
        child: Container(      
          padding: EdgeInsets.fromLTRB(57, 12, 57, 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(labData['name'], style: TextStyle(fontSize: 20)),
              Text(labData['location_id'].toString(), style: TextStyle(fontSize: 14)), //TODO integrar com backend
              labStatusRow(labData),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
            LabPage(), settings: RouteSettings(arguments: labData)));
      },
    ),
  );
}

List<Color> labStatusColor = [
  Color(0xFFFF0000),
  Color(0xFF00FF29),
  Color(0xFFFFF500)
];
List<String> labStatusText = [
  '  Ocupado',
  '  Livre',
  '  Reservado'
];

Widget labStatusRow(Map labData){
  var _status = labData['is_in_use'] ? 0 : labData['occupied_at'] == null ? 1 : 2; //0 é ocupado, 1 é livre e 2 é reservado
  return Container(
    padding: EdgeInsets.fromLTRB(0, 10, 0, 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: labStatusColor[_status]),
              width: 16,
              height: 16,
            ),
            Text(labStatusText[_status], style: TextStyle(fontSize: 11)),
          ],
        ),
        _status == 2 ? labTimeRow(DateTime.parse(labData['occupied_at'])) : Center(),
      ],
    ),
  );
}

Widget labTimeRow(DateTime date){
  return Row(
    children: <Widget>[
      Icon(CustomIcons.ajuda, size: 13),
      Text("  ${date.hour.toString()}:${date.minute.toString()}", style: TextStyle(fontSize: 11)),
    ],
  );
}

Widget textBar(TextEditingController controller, String type){
  return Container(
    height: 30,
    child: Card(
      margin: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      child: TextField(
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12, 6, 0, 0),
          hintText: 'Digite o $type ...',
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    )
  );
}

Widget statusButton(String status, Function onTap){
  var color = status == "Livre" ? Color(0xFF00FF29) : status == "Reservado" ? Color(0xFFFFF500) : Color(0xFFFF0000);
  return GestureDetector(
    child: Container(
      width: 117,
      height: 30,
      margin: EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18
          ),
        ),
      ),
    ),
    onTap: () async {
      onTap();
    },
  );
}