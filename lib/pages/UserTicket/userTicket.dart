import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/pages/UserTicket/bloc/userTicket_bloc.dart';
import 'package:comunica_mobile/pages/UserTicket/bloc/userTicket_state.dart';
import 'package:comunica_mobile/pages/UserTicket/loremIpsum.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/TicketPageCard.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

//Pagina de detalhes de um Chamado aberto por um usuario

//CustomBottomNavigationBar() que define a barra inferior dessa pagina está na branch developer
//Ela deve aparecer com essa pagina enquanto a botomnavigator da lista de chamados deve ser: abrir chamado e lista de chamados

//TODO:  Usar essa condicional de carregamento é o ideal? Carregar um bloc para cada campo é mais "custoso"?
//TODO: Inserir os Widgets de Carregamento de Pagina e erro (do branch developer) ao invez de TEXT
class UserTicket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserTicketBloc, UserTicketState>(
            builder: (context, state) {
          if (state is UserTicketSuccess) {
            return Text(state.ticket.title);
          } else {
            return Text("Falha");
          }
        }),
      ),
      drawer: handlerSideBar(context),
      backgroundColor: Colors.transparent,
      body: BlocBuilder<UserTicketBloc, UserTicketState>(
          builder: (context, state) {
        if (state is UserTicketSuccess) {
          return SafeArea(
              child: Container(
            padding: EdgeInsets.all(10.0),
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF4343C3),
                  Color(0xFF000080),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.5],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          CustomIcons.thumb_up,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(state.ticket.likes.toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          CustomIcons.thumb_down,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(state.ticket.dislikes.toString(),
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TicketPageCard(
                      context: context,
                      mainTitle: 'Status',
                      cardTitle: state.ticket.status,
                      //state.ticket.status,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    TicketPageCard(
                      context: context,
                      mainTitle: 'Tipo',
                      cardTitle: state.ticket.category,
                      //state.ticket.type,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TicketPageCard(
                      context: context,
                      mainTitle: 'Data',
                      cardTitle: state.ticket.dateTime
                          .toString(), //TODO formatar para receber somente a data e o outro somente a hora
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    TicketPageCard(
                      context: context,
                      mainTitle: 'Hora de Criação',
                      cardTitle: '19:00', //Mesma coisa que acima
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                  ],
                ),
                TicketPageCard(
                  context: context,
                  mainTitle: 'Descrição',
                  height: MediaQuery.of(context).size.height * 0.3,
                  mainTitleFlex: 1,
                  subCardFlex: 4,
                  subCard: Stack(
                    //overflow: Overflow.clip,
                    children: <Widget>[
                      Positioned(
                        top: 7.5,
                        bottom: 7.5,
                        right: 6,
                        child: Container(
                          width: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xFFE3E3E3),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Text(
                                state.ticket.description, //loremIpsum,
                                //Variavel de teste do Texto da descrição, Trocar pela que recebe do back-end
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
        } else {
          return SafeArea(child: Text("Falha"));
        }
      }),
    );
  }
}
