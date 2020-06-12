import 'package:comunica_mobile/pages/UserTicket/bloc/filterUserTicketList/bloc.dart';
import 'package:comunica_mobile/widgets/CustomBottomNavigationBar/customBottomNavigationBar.dart';
import 'package:comunica_mobile/widgets/FilterWidgets/filterPin.dart';
import 'package:comunica_mobile/widgets/FilterWidgets/menuBuilder.dart';
import 'package:comunica_mobile/widgets/FilterWidgets/menuItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:comunica_mobile/widgets/sideBar.dart';
import 'package:comunica_mobile/widgets/TicketWidgets/ticketCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTicketList extends StatefulWidget {
  @override
  _UserTicketListState createState() => _UserTicketListState();
}

class _UserTicketListState extends State<UserTicketList>
    with SingleTickerProviderStateMixin {
  final _searchController = TextEditingController();
  bool visibility = false;

  AnimationController _iconRotationController;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchWord);
    _iconRotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _iconRotationController.dispose();
    super.dispose();
  }

  _searchWord() {
    print('Word is: ${_searchController.text} ');
    if (_searchController.text != "") {
      setState(() {
        visibility = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterUserTicketListBloc, FilterUserTicketListState>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_arrow,
                  progress: _iconRotationController,
                ),
                onPressed: () {
                  if (state is DefaultTab) {
                    Scaffold.of(context).openDrawer();
                  } else {
                    _iconRotationController.reverse();
                    BlocProvider.of<FilterUserTicketListBloc>(context)
                        .add(BackIconPressed());
                  }
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Visibility(
                visible: state is FilteringWithSearchBar,
                replacement: Text('Lista de Chamados'),
                child: Container(
                  width: 240,
                  height: 40,
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: TextField(
                    autofocus: true,
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (searchKeyword) {
                      BlocProvider.of<FilterUserTicketListBloc>(context)
                          .add(AddFilterPin(searchKeyword));
                    },
                    style: TextStyle(
                      height: 1.3,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      fillColor: Colors.white,
                      filled: true,
                      isDense: true,
                      contentPadding: EdgeInsets.all(10.0),
                      suffixIcon: Visibility(
                        visible: visibility,
                        child: IconButton(
                          icon: Icon(
                            Icons.cancel,
                          ),
                          iconSize: 20,
                          color: Colors.black45,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            setState(() {
                              _searchController.text = "";
                              visibility = false;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  _iconRotationController.forward();
                  BlocProvider.of<FilterUserTicketListBloc>(context)
                      .add(SearchIconPressed());
                },
              )
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Container(
              height: 30,
              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 7.0),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 100),
                child: state is! FilteringWithStatusTab
                    ? MenuBuilder(
                        <MenuItem>[
                          MenuItem(
                            'Status',
                            onPressed: () {
                              _iconRotationController.forward();
                              BlocProvider.of<FilterUserTicketListBloc>(context)
                                  .add(FilterBy('Status'));
                            },
                          ),
                          MenuItem('Data'),
                          MenuItem('Tipo'),
                          MenuItem('Nome'),
                        ],
                        key: ValueKey(1),
                      )
                    : MenuBuilder(
                        <MenuItem>[
                          MenuItem(
                            'Finalizado',
                            fillColor: Color(0xFF00FF29),
                            labelColor: Colors.black,
                          ),
                          MenuItem(
                            'Andamento',
                            fillColor: Color(0xFFFFF500),
                            labelColor: Colors.black,
                          ),
                          MenuItem(
                            'Pendente',
                            fillColor: Color(0xFFFF0000),
                            labelColor: Colors.black,
                          ),
                        ],
                        key: ValueKey(2),
                      ),
              ),
            ),
          ),
        ),
        drawer: handlerSideBar(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(
                fit: state is FilteringWithSearchBar && state.pinnedKeyword
                    ? FlexFit.tight
                    : FlexFit.loose,
                flex: state is FilteringWithSearchBar && state.pinnedKeyword
                    ? 1
                    : 0,
                child: AnimatedOpacity(
                  opacity:
                      state is FilteringWithSearchBar && state.pinnedKeyword
                          ? 1.0
                          : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: state is FilteringWithSearchBar && state.pinnedKeyword
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return FilterPin(
                              state.keyword,
                              onTap: () {
                                BlocProvider.of<FilterUserTicketListBloc>(
                                        context)
                                    .add(RemoveFilterPin());
                              },
                            );
                          },
                        )
                      : SizedBox.shrink(),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: state is FilteringWithSearchBar && state.pinnedKeyword
                    ? 9
                    : 1,
                child: ListView.builder(
                  itemCount: 3,
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
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      );
    });
  }
}
