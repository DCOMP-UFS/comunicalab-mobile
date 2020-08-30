import 'package:comunica_mobile/icons/custom_icons_icons.dart';
import 'package:comunica_mobile/pages/Calls/bloc/callList_bloc.dart';
import 'package:comunica_mobile/pages/Calls/bloc/callList_state.dart';
import 'package:comunica_mobile/pages/Calls/widgets/customBottomNavigationBar.dart';
import 'package:comunica_mobile/pages/Calls/widgets/listItemComment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListComments extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lista de Comentários",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Título do Chamado",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
      body: BlocBuilder<CallListBloc, CallListState>(
        builder: (context, state) {
          print(state.calls);
          if (state is CallListSuccess) {
            return Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
              child: ListView.builder(
                itemCount: state.calls.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      CustomSlidable(state.calls[index]),
                      Divider(
                        height: 1,
                      )
                    ],
                  );
                },
              ),
            );
          } else if (state is CallListLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
