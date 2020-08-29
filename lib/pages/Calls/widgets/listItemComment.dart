import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/pages/Calls/commentItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomSlidable extends StatelessWidget {
  String textBig = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur condimentum sapien quam, interdum' +
      'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, '
          'interdum lacus egestas ac. Maecenas arcu odio, maximus at fringilla sit amet, ';
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => Comment()));
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: MediaQuery.of(context).size.height * 0.18,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nome de Usuário",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "12 de ago",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  // Espaço em Branco
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  // Texto e Botoões
                  Flexible(
                    flex: 6,
                    child: Column(
                      children: [
                        Text(
                          textBig,
                          style: TextStyle(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Flexible(
                    child: Container(),
                    flex: 1,
                  ),
                  Flexible(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text('20'),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(6, 0, 0, 5),
                                    child: Icon(CustomIcons.thumb_up),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('1'),
                                  Padding(
                                  padding: EdgeInsets.fromLTRB(6, 6, 0, 0),
                                  child: Icon(
                                    CustomIcons.thumb_down
                                  ),
                                ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Editar',
          color: Colors.green,
          icon: CustomIcons.caneta,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Excluir',
          color: Colors.red,
          icon: CustomIcons.lixeira,
          onTap: () {},
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Ocultar',
          color: Colors.lightBlue,
          icon: CustomIcons.ocultar,
          onTap: () {},
        ),
      ],
    );
  }
}
