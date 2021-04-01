import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comunica_mobile/pages/Equipment/resources/bloc/imgSoftList_bloc.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/widgets/customCard.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/customBottomNavigationBar.dart';

class ImgSoftList extends StatefulWidget {
  @override
  _ImgSoftListState createState() => _ImgSoftListState();
}

class _ImgSoftListState extends State<ImgSoftList> {
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
    return BlocBuilder<ImgSoftListBloc, int>(builder: (context, count) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Imagens e Softwares"),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Container(
                height: 30,
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 7.0),
                child: TabBar(
                  onTap: (tab) {
                    switch (tab) {
                      case 0:
                        BlocProvider.of<ImgSoftListBloc>(context)
                            .add(ImgSoftEvent.isImage);
                        break;
                      case 1:
                        BlocProvider.of<ImgSoftListBloc>(context)
                            .add(ImgSoftEvent.isSoftware);
                        break;
                    }
                  },
                  labelColor: Color(0xFF000080),
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  tabs: [
                    customTab("Imagens"),
                    customTab("Softwares"),
                  ],
                ),
              ),
            ),
          ),
          drawer: handlerSideBar(context),
          body: Container(
            margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
            child: TabBarView(
              children: <Widget>[
                //Image Content
                ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CustomCard('Imagem ${index + 1}');
                  },
                ),
                //Software Content
                ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return CustomCard('Software ${index + 1}');
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavigationBar(),
        ),
      );
    });
  }
}
