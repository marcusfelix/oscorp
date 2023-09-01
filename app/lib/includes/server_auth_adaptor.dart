import 'package:app/models/user.dart';
import 'package:dio/dio.dart';

class ServerAuthAdaptor {
  final dio = Dio();

  ServerAdaptor({ required String url }){
    dio.options.baseUrl = url;
  }

  Future<Response> login(User user) async {
    return await dio.post("/auth/login", data: user.toJson());
  }

  Future<Response> register(User user) async {
    return await dio.post("/auth/register", data: user.toJson());
  }

  Future<Response> update(User user) async {
    return await dio.put("/auth/update", data: user.toJson());
  }

  Future<Response> logout() async {
    return await dio.delete("/auth/logout");
  }
}