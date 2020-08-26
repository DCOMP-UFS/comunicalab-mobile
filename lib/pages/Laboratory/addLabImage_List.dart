import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/addLabImage_bloc.dart';


class AddLabImage_List extends StatelessWidget {
  final String nomeLab;

  AddLabImage_List(this.nomeLab);

  bool _chekBoxValue = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.all(5),
            child: Center(
              child: Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [BoxShadow(
                      //color: Color.fromRGBO(0, 0, 0, 0.25),
                      //offset: Offset(4, 4),
                    )],
                  ),
                  child: Row(
                    children: [
                      BlocBuilder<AddLabImage_Bloc, int>(
                          builder: (context, _ ) {
                            return Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.black
                              ),
                              child: Checkbox(
                                value: _chekBoxValue,
                                checkColor: Colors.white,
                                activeColor: Theme.of(context).primaryColor,
                                onChanged: (bool value) {
                                  _chekBoxValue = value;
                                  if (value)
                                    BlocProvider.of<AddLabImage_Bloc>(context)
                                        .add(AddLabImageEvent.increment);
                                  else
                                    BlocProvider.of<AddLabImage_Bloc>(context)
                                        .add(AddLabImageEvent.decrement);
                                },
                              ),
                            );
                          }
                      ),
                      SizedBox(
                        width: 90,
                      ),
                      Text(
                        nomeLab,
                        style: TextStyle(fontSize: 16, color: Color(0xFF000080)),
                      )
                    ],
                  )
              ),
            )
        ),
      ],
    );
  }
}
