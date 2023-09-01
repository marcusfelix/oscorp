import 'package:dio/dio.dart';

class ServerAdaptor<T> {
  final dio = Dio();

  ServerAdaptor({ required String url, required String bearer }){
    dio.options.baseUrl = url;
    dio.options.headers["Authorization"] = "Bearer $bearer";
  } 

  Future<Response> get(String path) async {
    return await dio.get(path);
  }

  Future<Response> post(String path, dynamic data) async {
    return await dio.post(path, data: data);
  }

  Future<Response> put(String path, dynamic data) async {
    return await dio.put(path, data: data);
  }

  Future<Response> delete(String path) async {
    return await dio.delete(path);
  }

  Future<Response> patch(String path, dynamic data) async {
    return await dio.patch(path, data: data);
  }
}