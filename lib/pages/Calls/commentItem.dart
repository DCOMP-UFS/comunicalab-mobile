import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/models/call.dart';
import 'package:comunica_mobile/pages/Calls/bloc/callList_bloc.dart';
import 'package:comunica_mobile/pages/Calls/bloc/callList_event.dart';
import 'package:comunica_mobile/pages/Calls/widgets/buttonItemComment.dart';
import 'package:comunica_mobile/pages/Calls/widgets/cardItemComment.dart';
import 'package:comunica_mobile/pages/Calls/widgets/customBackground.dart';
import 'package:comunica_mobile/pages/Calls/widgets/customBottomNavigationBar.dart';
import 'package:comunica_mobile/pages/Calls/widgets/listItemComment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Comment extends StatelessWidget {
  final Call call;
  Comment(this.call);

  bool isUser = true;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CallListBloc>(context);

    Widget widget = isUser
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: ButtonComment('Editar'),
                onTap: () {},
              ),
              GestureDetector(
                child: ButtonComment('Excluir'),
                onTap: () {
                  bloc.add(DeleteCall(call: call));
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: ButtonComment('Ocultar'),
                onTap: (){
                  bloc.add(HideCall(call: call));
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Comentário",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Título do Chamado",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
      body: CustomPaint(
        painter: customBackground(),
        child: Container(
          // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          // height: MediaQuery.of(context).size.height * 0.6,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [Colors.blue, Colors.blueAccent],
          //   ),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: CardComment(call),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: widget,
              )
            ],
          ),
          // color: customBackground,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
