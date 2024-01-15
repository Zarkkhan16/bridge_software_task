import 'package:bridge_software_task/network/api_constants.dart';
import 'package:bridge_software_task/network/network_util.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://asos2.p.rapidapi.com/',
      headers: {
        'X-RapidAPI-Key': '05266c1cecmsh8de520fac904b27p1a6a67jsnc429e6439ba3',
        'X-RapidAPI-Host': 'asos2.p.rapidapi.com',
      },
    ),
  );

  static Future<(ResponseStatus, dynamic)> makeRequest({
    required ApiMethod method,
    required Api api,
    Map<String, dynamic> params = const {},
  }) async {
    if (!(await NetworkUtil.isConnected())) {
      return (ResponseStatus.noInternet, 'No Internet Connection');
    }

    try {
      Response response;

      switch (method) {
        case ApiMethod.get:
          response = await _dio.get(api, queryParameters: params);
          break;
        case ApiMethod.post:
          response = await _dio.post(api, queryParameters: params);
          break;
      }

      if (response.statusCode != 200) {
        return (ResponseStatus.failure, 'Something went wrong');
      }

      return (ResponseStatus.success, response.data);
    } catch (e) {
      return (ResponseStatus.failure, e);
    }
  }
}
