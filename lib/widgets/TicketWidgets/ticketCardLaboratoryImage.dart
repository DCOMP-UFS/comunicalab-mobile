import 'package:comunica_mobile/models/ticket.dart';
import 'package:comunica_mobile/pages/Laboratory/bloc/addLabImage_bloc.dart';
import 'package:comunica_mobile/pages/Laboratory/bloc/ticketCardLaboryImage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketCardLaboratoryImage extends StatelessWidget {
  final String nameLab;
  final String nameDepart;
  final Ticket ticket;



  TicketCardLaboratoryImage(this.ticket, this.nameLab, this.nameDepart);

  bool _chekBoxValue = false;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    print(size);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              //color: Color.fromRGBO(0, 0, 0, 0.25),
              //offset: Offset(4, 4),
            )
          ],
        ),
        child:
          Column(
            children: [
              Row(
                children: [
                  BlocBuilder<AddLabImage_Bloc, int>(
                      builder: (context, _) {
                        return Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.black),
                          child: Checkbox(
                            value: _chekBoxValue,
                            checkColor: Colors.white,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (bool value) {
                              _chekBoxValue = value;
                              if (value)
                                BlocProvider.of<AddLabImage_Bloc>(context)
                                    .add(AddLabImageEvent.increment);
                              else
                                BlocProvider.of<AddLabImage_Bloc>(context)
                                    .add(AddLabImageEvent.decrement);
                            },
                          ),
                        );
                      }),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameLab,
                          style: TextStyle(
                              fontSize: 16, color: Color(0xFF000080)),
                        ),
                        Text(
                          nameDepart,
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF000080)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              BlocBuilder<TicketCardLaboryImage_bloc, String>(
                                  builder: (context, state) {
                                    return Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.brightness_1,
                                                color: cor(ticket.status),
                                                size: 14
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              ticket.status,
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: size * 0.4,
                                        ),
                                        (ticket.status == "Reservado")
                                            ? Row(
                                          children: [
                                            Icon(Icons.access_time, size: 14, ),
                                            Text("12:00", style: TextStyle(),)
                                          ],
                                        ): Container()
                                      ],
                                    );
                                  }),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
      ),
    );
    
  }
  Color cor(String cor){
    if(cor == "Ocupado"){
        return Colors.red;
    }else if (cor == "Reservado")
      return Colors.yellow;
    else 
      return Colors.green;
  }
}
