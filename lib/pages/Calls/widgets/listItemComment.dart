import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/models/call.dart';
import 'package:comunica_mobile/pages/Calls/bloc/bloc.dart';
import 'package:comunica_mobile/pages/Calls/commentItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomSlidable extends StatelessWidget {
  final Call call;

  CustomSlidable(this.call);

  bool isUser = true;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).devicePixelRatio;
    var screenWidth = MediaQuery.of(context).size.width * mediaQuery;
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        height: screenWidth < 700 ? MediaQuery.of(context).size.height * 0.25 : MediaQuery.of(context).size.height * 0.18,
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
                          maxRadius: screenWidth < 700 ? 15 : 20,
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
                        call.name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        call.date,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<CallListBloc>(context),
                      child: Comment(call),
                    ),
                  ),
                );
              },
              child: Row(
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
                          call.message,
                          style: TextStyle(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
                        flex: 1,
                        child: Container(),
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(call.liked.toString()),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(6, 0, 0, 5),
                                  child: Icon(CustomIcons.thumb_up),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(call.disliked.toString()),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(6, 6, 0, 0),
                                  child: Icon(CustomIcons.thumb_down),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: ,),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      actions: isUser == true
          ? <Widget>[
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
                onTap: () {
                  BlocProvider.of<CallListBloc>(context).add(DeleteCall(call: call));
                  final snackBar = SnackBar(
                    content: Text('Comentário excluído'),
                    duration: Duration(seconds: 2),
                  );

                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ]
          : null,
      secondaryActions: isUser == false
          ? <Widget>[
              IconSlideAction(
                caption: 'Ocultar',
                color: Colors.lightBlue,
                icon: CustomIcons.ocultar,
                onTap: () {
                  BlocProvider.of<CallListBloc>(context).add(HideCall(call: call));
                  final snackBar = SnackBar(
                    content: Text('Comentário ocultado'),
                    duration: Duration(seconds: 2),
                  );

                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ]
          : null,
    );
  }
}
