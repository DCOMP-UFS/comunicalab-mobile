import 'package:flutter/material.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/ticketCard.dart';

class UserTicketList extends StatefulWidget {
  @override
  _UserTicketListState createState() => _UserTicketListState();
}

class _UserTicketListState extends State<UserTicketList> {
  final searchController = TextEditingController();
  final bool statusTouched = false;
  final bool showSearchBar = false;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Widget filterOption(String label) {
    return RawMaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      fillColor: Colors.white,
      child: Text(
        label,
        style: TextStyle(
          color: Color(0xFF000080),
          fontSize: 16,
        ),
      ),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: showSearchBar
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 250,
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(12.0),
                      ),
                    ),
                  ),
                  Icon(Icons.search),
                ],
              )
            : Text('Lista de Chamados'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            height: 30,
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                filterOption('Status'),
                filterOption('Data'),
                filterOption('Tipo'),
                filterOption('Nome'),
              ],
            ),
          ),
        ),
      ),
      drawer: handlerSideBar(context),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return TicketCard(
            title: "Fulano da Silva Santos",
            lab: "Hardware",
            status: "Pendente",
            dateTime: DateTime.now(),
            like: true,
            onPressedLike: () {},
            onPressedDislike: () {},
            likesNumber: 1,
            dislikesNumber: 2,
          );
        },
      ),
    );
  }
}
