import 'package:comunica_mobile/pages/Images/imagesInfo.dart';
import 'package:comunica_mobile/pages/Images/infoTela.dart';
import 'package:comunica_mobile/pages/Images/softwareTela.dart';
import 'package:flutter/material.dart';

class ImagesDetails extends StatefulWidget {
  final imagesInfo imag;
  ImagesDetails(this.imag);

  @override
  ImagesDetailsState createState() => ImagesDetailsState();
}

class ImagesDetailsState extends State<ImagesDetails>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

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
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    _tabController.addListener(_handleTabIndex);
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.imag.softwareName),
        actions: _appBarActions(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            height: 30,
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 7.0),
            child: TabBar(
              controller: _tabController,
              onTap: (tab) {},
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
      //drawer: handlerSideBar(context),
      body: Container(
        margin: EdgeInsets.all(0.0),
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[infoTela(widget.imag), softwareTela()],
        ),
      ),
    );
  }

  List<Widget> _appBarActions() {
    switch (_tabController.index) {
      case 0:
        {
          return [Container()];
        }
      case 1:
        {
          return [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () {}, child: Icon(Icons.filter_list)))
          ];
        }
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }
}
