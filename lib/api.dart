//Colocar nesse arquivo as funções e configurações referentes ao programa

import 'package:dio/dio.dart';

final Dio client =
    Dio(BaseOptions(baseUrl: 'https://comunicabacksandbox.herokuapp.com/'));

Future<Response> getLabs() async {
  return client.get('/laboratory');
}

Future<Response> getLabTickets(int labId) {
  return client.get('/laboratory/$labId/ticket');
}

Future<Response> deleteSoftwareTicket(int softwareId) {
  return client.delete(
      '/softProblem/$softwareId/ticket'); //TODO: Verificar se os comandos no back são assim
}
