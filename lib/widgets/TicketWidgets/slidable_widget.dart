import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum SlidableAction { edit, delete }
//Constroi as opções do menu que aparece por trás da lista de chamados
//Slidable menu , Flutter ver esse vid para entender a implementação: https://www.youtube.com/watch?v=TmSKRUVKNsQ

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget(
      {@required this.child, @required this.onDismissed, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        child: child,
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.30,
        //Lado esquerdo
        actions: <Widget>[
          IconSlideAction(
            caption: 'Editar',
            color: Colors.green,
            iconWidget: Icon(
              Icons.edit,
              size: 35,
              color: Colors.white,
            ),
            onTap: () => onDismissed(SlidableAction.edit),
          ),
          IconSlideAction(
            caption: 'Apagar',
            color: Colors.red,
            iconWidget: Icon(
              Icons.delete,
              size: 35,
              color: Colors.white,
            ),
            onTap: () => onDismissed(SlidableAction.delete),
          )
        ],
      );
}
