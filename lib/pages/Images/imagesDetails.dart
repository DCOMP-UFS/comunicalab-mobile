import 'package:comunica_mobile/pages/Images/infoTela.dart';
import 'package:comunica_mobile/pages/Images/softwareTela.dart';
import 'package:flutter/material.dart';


class imagesDetails extends StatefulWidget {

  final String softwareName;
  imagesDetails(this.softwareName);

  @override
  _imagesDetailsState createState() => _imagesDetailsState();
}

class _imagesDetailsState extends State<imagesDetails> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000080),
        title: Text(widget.softwareName),
        elevation: 0,
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Color(0xFF000080),
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(10),
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
          ),
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Container(
                width: 120,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Colors.white,
                        width: 1
                    )
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Informações"),
                ),
              ),
            ),Tab(
              child: Container(
                width: 120,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Colors.white,
                        width: 1
                    )
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Softwares"),
                ),
              ),
            ),

          ],
        ),
      ) ,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          infoTela(),
          softwareTela()
        ],
      ),
    );
  }
}
