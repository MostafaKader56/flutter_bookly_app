import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMesssage;

  const Failure(this.errorMesssage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMesssage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Recieve timeout with ApiServer');
      case DioErrorType.badCertificate:
        return ServerFailure('Invalid/Incomplete Certificate Chain');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to the ApiServer was canceld');
      case DioErrorType.connectionError:
        // return ServerFailure('Connection Error with ApiServer');
        return ServerFailure('No internet connection');
      case DioErrorType.unknown:
        // dioError.message != null && dioError.message!.contains('SocketException')
        // print('asdafae  ${dioError.t == SocketException}');
        // print('asdafae${dioError.message!.contains('SocketException')}');
        // print('asdafae${dioError.message!.toString()}');
        if (dioError.message != null && dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        } else {
          return ServerFailure('Unexpected Error, Please try again!');
        }
      default:
        return ServerFailure(
            'Opps there was an Error, Please try again later!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your resquest not found, Please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, Please try again later!');
    } else {
      return ServerFailure('Opps there was an Error, Please try again later!');
    }
  }
}
