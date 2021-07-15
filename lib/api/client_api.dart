import 'dart:io';

import 'package:comunica_mobile/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'api.dart';

class ClientApi {
  Future<Either<Failure, Response>> post(
      {String endPoint, Map<dynamic, dynamic> map}) async {
    Dio client = Dio(BaseOptions(baseUrl: Api.baseUrl));

    var hasConnection = await checkInternetConnection();

    if (hasConnection) {
      var response = await client.post(endPoint, data: map);
      return Right(response);
    }
    return Left(ConnectionError('Sem conexão com a internet.'));
  }

  Future<Either<Failure, Response>> get(
      {String endPoint, Map<String, dynamic> map}) async {
    Dio client = Dio(BaseOptions(baseUrl: Api.baseUrl));
    var hasConnection = await checkInternetConnection();

    if (hasConnection) {
      var response = await client.get(endPoint, queryParameters: map);
      return Right(response);
    }
    return Left(ConnectionError('Sem conexão com a internet.'));
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }

    return false;
  }
}
