import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:flutter/material.dart';

class CommomNavigator extends StatefulWidget {
  final List<Widget> options;
  final List<Icon> icons;
  final List<AppBar> titles;

  CommomNavigator({
    @required this.options,
    @required this.icons,
    @required this.titles,
  });

  @override
  _CommomNavigatorState createState() => _CommomNavigatorState();
}

class _CommomNavigatorState extends State<CommomNavigator> {
  var controller = 3;

  Widget bottomBar() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      margin: EdgeInsets.all(0),
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: controller == 0 ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              color: controller == 0 ? Colors.white : Theme.of(context).primaryColor,
              icon: widget.icons[0],
              onPressed: () {
                setState(() {
                  controller = 0;
                });
              },
            )
          ),
          Container(
            decoration: BoxDecoration(
              color: controller == 1 ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              color: controller == 1 ? Colors.white : Theme.of(context).primaryColor,
              icon: widget.icons[1],
              onPressed: () {
                setState(() {
                  controller = 1;
                });
              },
            )
          ),
          Container(
            decoration: BoxDecoration(
              color: controller == 2 ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              color: controller == 2 ? Colors.white : Theme.of(context).primaryColor,
              icon: widget.icons[2],
              onPressed: () {
                setState(() {
                  controller = 2;
                });
              },
            )
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(controller == 3){
          return true;
        } else {
          setState(() {
            controller = 3;
          });
          return false;
        }
      },
      child: Scaffold(
        appBar: widget.titles[controller],
        drawer: handlerSideBar(context),
        body: widget.options[controller],
        bottomNavigationBar: bottomBar(),
      ),
    );
  }
}