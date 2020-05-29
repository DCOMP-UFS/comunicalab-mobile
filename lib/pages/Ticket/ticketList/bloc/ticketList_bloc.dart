import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/pages/Ticket/ticketList/bloc/bloc.dart';
import 'package:comunica_mobile/widgets/loadingWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketListBloc extends Bloc<TicketListEvent, TicketListState> {
  @override
  get initialState => TicketListLoadInProgress();

  int likes = 30;
  int dislikes = 40;
  bool like;

  @override
  Stream<TicketListState> mapEventToState(event) async* {
    try {
      if (event is TicketListFetch) {
        if (state is TicketListLoadInProgress) {
          await Future.delayed(Duration(seconds: 2));
          yield TicketListLoadSuccess();
        }
      }
      if (event is TicketLiked) {
        if (like == null) {
          print("1");
          like = true;
          likes++;
        } else if (like == true) {
          print("2");
          like = null;
          likes--;
        } else if (like == false) {
          print("3");
          like = true;
          likes++;
          dislikes--;
        }
        yield TicketLikeAdded();
      } else if (event is TicketDisliked) {
        if (like == null) {
          like = false;
          dislikes++;
        } else if (like == false) {
          like = null;
          dislikes--;
        } else if (like == true) {
          like = false;
          dislikes++;
          likes--;
        }
        yield TicketDislikeAdded();
      }
    } catch (_) {
      yield TicketListLoadFailure();
    }
  }
}
