import 'package:dio/dio.dart';

abstract class ILoginRepository {
  // Todo: Add Login request class signitures (interfaces) here.
  Future<Response<dynamic>> login(Map<String, dynamic> loginPayload);
}