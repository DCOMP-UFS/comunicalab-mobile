import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/models/call.dart';
import 'package:comunica_mobile/pages/Calls/bloc/callList_bloc.dart';
import 'package:comunica_mobile/pages/Calls/bloc/callList_event.dart';
import 'package:comunica_mobile/pages/Calls/listComments.dart';
import 'package:comunica_mobile/pages/Calls/widgets/customBottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:comunica_mobile/pages/Images/widgets/customBackground.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class comentarioTela extends StatefulWidget {
  @override
  _comentarioTelaState createState() => _comentarioTelaState();
}

class _comentarioTelaState extends State<comentarioTela> {

  final myController = TextEditingController();

  //int _currentIndex = 2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Título do Chamado"),
            Text("",style: TextStyle(fontSize: 3),),
            Text(
                "Laboratório de Hardware 2",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CustomPaint(
          painter: customBackground(),
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.width * 1,
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 320,//MediaQuery.of(context).size.width * 1,//320,
                    height: 352,//MediaQuery.of(context).size.width * 1,//352,
                    decoration: BoxDecoration(
                      color: Color(0xFFF9FDFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Row(
                              children: <Widget>[
                                Container(width: 50,),
                                Container(child: Icon(CustomIcons.fazercomentario,size: 30, color: Colors.black,),),
                                Text(
                                    " DEIXE SEU COMENTÁRIO:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15,0,15,8),
                          //color: Colors.red,
                          height: 280,
                          decoration: BoxDecoration(
                            color: Color(0xFFF9FDFF),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(Icons.account_circle,size: 50, color: Colors.grey,),
                                  ),
                                  height: 300,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF9FDFF),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white)
                                  ),
                                ),
                                Container(
                                  height: 280,
                                  width: 230,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF9FDFF),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white)
                                  ),
                                  child: TextField(
                                    decoration:InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      //icon: Icon(Icons.person_pin,size: 50,),
                                      hintText: "Nos dê sua opinião",
                                    ),
                                    controller: myController,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    onChanged: (text){
                                      print(myController.text);
                                    },
                                ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.white, width: 2 )
                      ),
                      elevation: 5,
                      margin: EdgeInsets.fromLTRB(15,0,15,8),
                      child: InkWell(
                        onTap: (){
                          if(myController.text.length>0) {
                          var id_increment = BlocProvider.of<CallListBloc>(context).state.calls.last.id;
                          id_increment++;
                          Call call = Call(
                            id: id_increment,
                            liked: 0,
                            disliked: 0,
                            name: 'Fulano',
                            date: '12 de ago',//DateTime.now().toString(),
                            message: myController.text,
                          );

                          BlocProvider.of<CallListBloc>(context).add(AddCall(call: call));
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: BlocProvider.of<CallListBloc>(context),
                                child: ListComments(),
                              ),
                            ),
                              );
                          return  showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                title: Text(
                                    "\n\t\t\t\t\tSeu comentário foi\nadicionado com sucesso!\n",
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                              );
                            },
                          );
                         /* Navigator.of(context).push(MaterialPageRoute(
                            builder: (_)=>ListComments()
                          ));*/
                        }},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF000080),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 150,
                          height: 30,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                "Adicionar Comentário",
                              style: TextStyle(color:Color(0xFFF9FDFF) ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),/*BottomNavigationBar(
        selectedItemColor: Color(0xFF000080),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            title: Text("Ver Comentários"),
          ),BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            title: Text("Meus Comentários"),
          ),BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            title: Text(""),
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      )*/
    );
  }
}
