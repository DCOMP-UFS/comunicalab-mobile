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

        //Debug
        final labs = await _fetchLabs();
        /*
        //Conversão para uma Lista de Labs
        //TODO corrigir na feature do Labs e alterar as variaveis dos estados e eventos para receber List<Lab> e nao List<Map>
        final List<Lab> listLabs = [];
        for (int i = 0; i < response.length; i++) {
          listLabs.add(Lab.fromJson(response[i]));
        }*/

        yield LabListSuccess(labsList: labs);
        /*
        Forma correta de chamar do servidor
        final labs =
            await getLabs(); //Os Labs ainda não estão prontos no servidor entao so aparece debugs

        yield LabListSuccess(labsList: List<Map>.from(labs.data));*/
      } else if (event is ApplyFilterLab) {
        yield LabsListLoading();

        //TODO Arrumar o filtro (corrigir pra filtrar por status)
        //Como o backend está so retornando se o laboratorio está em uso (Ocupado) ou não esta em uso e o horário de reserva o filtro em filterTickets precisa ser adaptado
        //ou aguardar alterações no backend caso necessário
        //final labs = await getLabs();
        final labs = await _fetchLabs();

        if (event.filter != null) {
          //final list = List<Map>.from(labs.data);
          final list = labs;
          final filteredTickets = filterTickets(event?.filter, list);

          yield LabListSuccess(
              labsList: filteredTickets, filter: event?.filter);
        } else {
          yield LabListSuccess(labsList: List<Map>.from(labs));
        }
      }
    } catch (_) {
      yield LabListError();
    }
  }
}

//Simular Laboratorios
Future<List<Map>> _fetchLabs() async {
  final response = [
    {
      "id": 1,
      "name": "Laboratorio de Software",
      "capacity": 20,
      "location_id": "Departamento",
      "is_in_use": false,
    },
    {
      "id": 2,
      "name": "Laboratorio de hardware",
      "capacity": 20,
      "location_id": "Departamento",
      "is_in_use": true,
    },
    {
      "id": 3,
      "name": "Laboratorio de Software",
      "capacity": 20,
      "location_id": "Departamento",
      "is_in_use": false,
      "occupied_at": DateTime.now().toString(),
    },
  ];

  await Future.delayed(Duration(seconds: 2)); //simula latência
  return response;
}
