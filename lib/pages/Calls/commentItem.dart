import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/models/call.dart';
import 'package:comunica_mobile/pages/Calls/widgets/buttonItemComment.dart';
import 'package:comunica_mobile/pages/Calls/widgets/cardItemComment.dart';
import 'package:comunica_mobile/pages/Calls/widgets/customBackground.dart';
import 'package:comunica_mobile/pages/Calls/widgets/customBottomNavigationBar.dart';
import 'package:comunica_mobile/pages/Calls/widgets/listItemComment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Comment extends StatelessWidget {
  final Call call;
  Comment(this.call);
  String textBig = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur condimentum sapien quam, interdum' +
      'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, '
          'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, ';

  bool isUser = false;

  @override
  Widget build(BuildContext context) {
    Widget widget = isUser
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonComment('Editar'),
              ButtonComment('Excluir'),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonComment('Ocultar'),
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
