import 'package:comunica_mobile/models/ticket.dart';
import 'package:comunica_mobile/widgets/errorWidget.dart';
import 'package:comunica_mobile/widgets/loadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/pages/UserTicket/bloc/bloc.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/customBottomNavigationBar.dart';
import 'package:comunica_mobile/widgets/FilterWidgets/filterBottomSheet.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/ticketCard.dart';

class UserTicketList extends StatefulWidget {
  @override
  _UserTicketListState createState() => _UserTicketListState();
}

class _UserTicketListState extends State<UserTicketList>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

//  MaterialColor customPrimarySwatch = MaterialColor(0xFF000080, <int, Color>{
//    50: Color(0xFFEAE3F3),
//    100: Color(0xFFC9BBE2),
//    200: Color(0xFFa68fcf),
//    300: Color(0xFF8262bc),
//    400: Color(0xFF6841af),
//    500: Color(0xFF4c1fa2),
//    600: Color(0xFF431b9d),
//    700: Color(0xFF351394),
//    800: Color(0xFF260d8d),
//    900: Color(0xFF000080),
//  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserTicketListBloc, UserTicketListState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Lista de Chamados'),
                IconButton(
                  icon: Icon(
                    Icons.filter_list,
                  ),
                  onPressed: state is! UserTicketListLoadSuccess
                      ? null
                      : () async {
                          if (state is UserTicketListLoadSuccess) {
                            filterBottomSheet(
                              context: context,
                              dateTime: state?.dateTime,
                              troubleType: state?.troubleType,
                              ticketStatus: state?.ticketStatus,
                            ).then((filter) {
                              BlocProvider.of<UserTicketListBloc>(context)
                                  .add(ApplyFilter(
                                filter['dateTime'],
                                filter['troubleType'],
                                filter['ticketStatus'],
                              ));
                            });
                          }
//                showModalBottomSheet<void>(
//                  //change void to the desired return type
//                  context: context,
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.vertical(
//                      top: Radius.circular(10.0),
//                    ),
//                  ),
//                  builder: (BuildContext context) {
//                    DateTime _dateTime;
//                    String _troubleType;
//                    String _ticketStatus = '';
//
//                    return StatefulBuilder(builder:
//                        (BuildContext context, StateSetter updatePreferences) {
//                      return Container(
//                        height: MediaQuery.of(context).size.height / 2,
//                        padding: EdgeInsets.all(20.0),
//                        child: SingleChildScrollView(
//                          child: Column(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Padding(
//                                padding: const EdgeInsets.only(
//                                  bottom: 20.0,
//                                ),
//                                child: Stack(
//                                  alignment: Alignment.center,
//                                  children: <Widget>[
//                                    Text(
//                                      'Filtro',
//                                      style: TextStyle(
//                                        color: Color(0xFF000080),
//                                        fontSize: 20,
//                                        fontWeight: FontWeight.bold,
//                                      ),
//                                    ),
//                                    Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.spaceBetween,
//                                      children: <Widget>[
//                                        InkResponse(
//                                          splashFactory:
//                                              InkRipple.splashFactory,
//                                          child: Container(
//                                            child: Icon(
//                                              Icons.close,
//                                              color: Color(0xFF625F5F),
//                                            ),
//                                          ),
//                                          onTap: () {
//                                            Navigator.of(context).pop();
//                                          },
//                                        ),
//                                        InkResponse(
//                                          splashFactory:
//                                              InkRipple.splashFactory,
//                                          child: Container(
//                                            padding: EdgeInsets.all(8.0),
//                                            child: Text(
//                                              'Limpar',
//                                              style: TextStyle(
//                                                color: Color(0xFF625F5F),
//                                                fontSize: 16,
//                                              ),
//                                            ),
//                                          ),
//                                          onTap: () {
//                                            updatePreferences(() {
//                                              _dateTime = null;
//                                              _troubleType = null;
//                                              _ticketStatus = '';
//                                            });
//                                          },
//                                        ),
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                              ),
//                              Container(
//                                //padding: const EdgeInsets.all(4.0),
//                                margin: EdgeInsets.symmetric(
//                                  vertical: 8.0,
//                                  horizontal: 4.0,
//                                ),
//                                child: Text(
//                                  'Data de abertura do chamado',
//                                  style: TextStyle(
//                                    fontSize: 18,
//                                  ),
//                                ),
//                              ),
//                              InkWell(
//                                splashFactory: InkRipple.splashFactory,
//                                borderRadius: BorderRadius.circular(8.0),
//                                onTap: () async {
//                                  await showDatePicker(
//                                      context: context,
//                                      initialDate: DateTime.now(),
//                                      firstDate: DateTime(2020, 1, 1),
//                                      lastDate: DateTime.now(),
//                                      helpText: 'SELECIONE UMA DATA',
//                                      fieldLabelText: 'Digite a data',
//                                      fieldHintText: 'dd/mm/aaaa',
//                                      errorFormatText: 'Formato inválido.',
//                                      errorInvalidText:
//                                          'Digite uma data válida.',
//                                      builder:
//                                          (BuildContext context, Widget child) {
//                                        return Theme(
//                                          data: ThemeData(
//                                            primarySwatch: customPrimarySwatch,
//                                          ),
//                                          child: child,
//                                        );
//                                      }).then((value) {
//                                    updatePreferences(() {
//                                      _dateTime = value;
//                                    });
//                                  });
//                                },
//                                child: Container(
//                                  width: double.infinity,
//                                  height: 45,
//                                  padding: const EdgeInsets.all(10.0),
//                                  decoration: BoxDecoration(
//                                    borderRadius: BorderRadius.circular(8.0),
//                                    border: Border.all(
//                                      color: Color(0xFFE0DFDF),
//                                      width: 2,
//                                    ),
//                                  ),
//                                  child: Row(
//                                    mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                    children: <Widget>[
//                                      Text(
//                                        _dateTime != null
//                                            ? '${_dateTime.day.toString().padLeft(2, '0')}/${_dateTime.month.toString().padLeft(2, '0')}/${_dateTime.year.toString()}'
//                                            : 'Escolha uma data',
//                                        style: TextStyle(
//                                          fontSize: 16,
//                                          color: Colors.black45,
//                                        ),
//                                      ),
//                                      InkResponse(
//                                        splashFactory: InkRipple.splashFactory,
//                                        highlightColor: Colors.transparent,
//                                        onTap: () {},
//                                        child: Icon(
//                                          Icons.keyboard_arrow_down,
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                              Container(
//                                margin: EdgeInsets.symmetric(
//                                  vertical: 8.0,
//                                  horizontal: 4.0,
//                                ),
//                                child: Text(
//                                  'Tipo de Problema',
//                                  style: TextStyle(
//                                    fontSize: 18,
//                                  ),
//                                ),
//                              ),
//                              InkWell(
//                                splashFactory: InkRipple.splashFactory,
//                                borderRadius: BorderRadius.circular(8.0),
//                                onTap: () {},
//                                child: Container(
//                                  padding: const EdgeInsets.all(10.0),
//                                  height: 45,
//                                  decoration: BoxDecoration(
//                                    borderRadius: BorderRadius.circular(8.0),
//                                    border: Border.all(
//                                      color: Color(0xFFE0DFDF),
//                                      width: 2,
//                                    ),
//                                  ),
//                                  child: DropdownButtonHideUnderline(
//                                    child: DropdownButton<String>(
//                                      icon: Icon(Icons.keyboard_arrow_down),
//                                      value: _troubleType,
//                                      hint: Text(
//                                        'Escolha um tipo de problema',
//                                        style: TextStyle(
//                                          fontSize: 16,
//                                          color: Colors.black45,
//                                        ),
//                                      ),
//                                      isExpanded: true,
//                                      onChanged: (String newValue) {
//                                        updatePreferences(() {
//                                          _troubleType = newValue;
//                                        });
//                                      },
//                                      items: <String>[
//                                        'Tipo de Problema 1',
//                                        'Tipo de Problema 2',
//                                        'Tipo de Problema 3',
//                                        'Tipo de Problema 4'
//                                      ].map<DropdownMenuItem<String>>(
//                                          (String value) {
//                                        return DropdownMenuItem<String>(
//                                          value: value,
//                                          child: Text(value),
//                                        );
//                                      }).toList(),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                              Container(
//                                margin: EdgeInsets.symmetric(
//                                  vertical: 8.0,
//                                  horizontal: 4.0,
//                                ),
//                                child: Text(
//                                  'Status do chamado',
//                                  style: TextStyle(
//                                    fontSize: 18,
//                                  ),
//                                ),
//                              ),
//                              Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceAround,
//                                children: <Widget>[
//                                  FlatButton(
//                                    color: _ticketStatus == 'Finalizado'
//                                        ? Color(0xFF00FF29)
//                                        : Color(0xFFEAEAEA),
//                                    highlightColor: Color(0xFF00FF29),
//                                    shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(10.0),
//                                    ),
//                                    child: Text(
//                                      'Finalizado',
//                                      style: TextStyle(
//                                        color: Colors.black87,
//                                      ),
//                                    ),
//                                    onPressed: () {
//                                      updatePreferences(() {
//                                        _ticketStatus == 'Finalizado'
//                                            ? _ticketStatus = ''
//                                            : _ticketStatus = 'Finalizado';
//                                      });
//                                    },
//                                  ),
//                                  FlatButton(
//                                    color: _ticketStatus == 'Andamento'
//                                        ? Color(0xFFFFF500)
//                                        : Color(0xFFEAEAEA),
//                                    highlightColor: Color(0xFFFFF500),
//                                    shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(10.0),
//                                    ),
//                                    child: Text(
//                                      'Andamento',
//                                      style: TextStyle(
//                                        color: Colors.black87,
//                                      ),
//                                    ),
//                                    onPressed: () {
//                                      updatePreferences(() {
//                                        _ticketStatus == 'Andamento'
//                                            ? _ticketStatus = ''
//                                            : _ticketStatus = 'Andamento';
//                                      });
//                                    },
//                                  ),
//                                  FlatButton(
//                                    color: _ticketStatus == 'Pendente'
//                                        ? Color(0xFFFF0000)
//                                        : Color(0xFFEAEAEA),
//                                    highlightColor: Color(0xFFFF0000),
//                                    shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(10.0),
//                                    ),
//                                    child: Text(
//                                      'Pendente',
//                                      style: TextStyle(
//                                        color: _ticketStatus == 'Pendente'
//                                            ? Colors.white
//                                            : Colors.black87,
//                                      ),
//                                    ),
//                                    onPressed: () {
//                                      updatePreferences(() {
//                                        _ticketStatus == 'Pendente'
//                                            ? _ticketStatus = ''
//                                            : _ticketStatus = 'Pendente';
//                                      });
//                                    },
//                                  ),
//                                ],
//                              ),
//                              Container(
//                                margin: EdgeInsets.symmetric(
//                                  vertical: 8.0,
//                                  horizontal: 4.0,
//                                ),
//                                child: SizedBox(
//                                  width: double.infinity,
//                                  child: FlatButton(
//                                    color: Color(0xFF000080),
//                                    padding:
//                                        EdgeInsets.symmetric(vertical: 10.0),
//                                    shape: RoundedRectangleBorder(
//                                      borderRadius: BorderRadius.circular(10.0),
//                                    ),
//                                    child: Text(
//                                      'Aplicar filtro',
//                                      style: TextStyle(
//                                        color: Colors.white,
//                                        fontSize: 18,
//                                      ),
//                                    ),
//                                    onPressed: () {
//                                      final filter = {
//                                        "dateTime": _dateTime?.toIso8601String(),
//                                        "type": _troubleType,
//                                        "status": _ticketStatus
//                                      };
//
//                                      Navigator.pop(context, filter);
//                                    },
//                                  ),
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                      );
//                    });
//                  },
//                );
                        },
                ),
              ],
            ),
          ),
          drawer: handlerSideBar(context),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: state is UserTicketListLoadInProgress
                ? LoadingWidget(message: "Carregando os chamados...")
                : state is UserTicketListLoadSuccess
                    ? ListView.builder(
                        itemCount: state?.userTickets?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return TicketCard(
                            ticket: state.userTickets[index],
                            onPressedLike: () {
                              BlocProvider.of<UserTicketListBloc>(context).add(
                                  UserTicketLiked(state.userTickets[index]));
                            },
                            onPressedDislike: () {
                              BlocProvider.of<UserTicketListBloc>(context).add(
                                  UserTicketDisliked(state.userTickets[index]));
                            },
                          );
                        },
                      )
                    : ErrorMessageWidget(
                        message: "Houve um erro ao carregar a lista."),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(),
        );
      },
    );
  }
}
