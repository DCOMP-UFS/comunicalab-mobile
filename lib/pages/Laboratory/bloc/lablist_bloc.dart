import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comunica_mobile/api.dart';
import 'package:comunica_mobile/models/lab.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

class LablistBloc extends Bloc<LablistEvent, LablistState> {
  @override
  LablistState get initialState => InitialLablistState();

  @override
  Stream<LablistState> mapEventToState(LablistEvent event) async* {
    final currentState = state;

    try {
      if (event is FetchLabsList) {
        yield LabsListLoading();

        final labs =
            await getLabs(); //Os Labs ainda não estão prontos no servidor entao so aparece debugs

        yield LabListSuccess(labsList: List<Map>.from(labs.data));
      } else if (event is ApplyFilterLab) {
        yield LabsListLoading();

        //TODO Arrumar o filtro (corrigir pra filtrar por status)
        //Como o backend está so retornando se o laboratorio está em uso (Ocupado) ou não esta em uso e o horário de reserva o filtro em filterTickets precisa ser adaptado
        //ou aguardar alterações no backend caso necessário
        final labs = await getLabs();

        if (event.filter != null) {
          final list = List<Map>.from(labs.data);
          final filteredTickets = filterTickets(event?.filter, list);

          yield LabListSuccess(
              labsList: filteredTickets, filter: event?.filter);
        } else {
          yield LabListSuccess(labsList: List<Map>.from(labs.data));
        }
      }
    } catch (_) {
      yield LabListError();
    }
  }
}
