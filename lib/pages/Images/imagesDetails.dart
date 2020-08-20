import 'package:comunica_mobile/pages/Images/infoTela.dart';
import 'package:comunica_mobile/pages/Images/softwareTela.dart';
import 'package:flutter/material.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';


class imagesDetails extends StatefulWidget {

  final String softwareName;
  imagesDetails(this.softwareName);

  @override
  _imagesDetailsState createState() => _imagesDetailsState();
}


class _imagesDetailsState extends State<imagesDetails> {

  Widget customTab(String label) {
    return Tab(
      child: Container(
        width: 117,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
      final mediaq =  MediaQuery.of(context);
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.softwareName),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Container(
                height: 30,
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 7.0),
                child: TabBar(
                  onTap: (tab) {

                  },
                  labelColor: Color(0xFF000080),
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  tabs: [
                    customTab("Informações"),
                    customTab("Softwares"),
                  ],
                ),
              ),
            ),
          ),
          drawer: handlerSideBar(context),
          body: Container(
            margin: EdgeInsets.all(0.0),
            child: TabBarView(
              children: <Widget>[
                infoTela(),
                softwareTela()
              ],
            ),
          ),
        ),
      );
  }
}