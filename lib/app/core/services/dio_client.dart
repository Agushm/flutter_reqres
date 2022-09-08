part of 'services.dart';

enum RequestType { GET, POST, DELETE, PUT }

class DioClient {
  var baseUrl = "https://reqres.in/api";
  Dio _dio = new Dio(BaseOptions(
    connectTimeout: 20000,
    receiveTimeout: 15000,
  ));
  Options? _headersOption;

  Future _getToken() async {
    // var _token = await ServicePreferances.instance.getToken();
    // if (_token != null) {
    //   _headersOption = ConfigServices.getHeaders(token: _token);
    // }
  }

  Future<dynamic> request(String url, RequestType type,
      {Map<String, dynamic>? params, dynamic data, bool? useToken}) async {
    var response;

    //If this route use token then fetch token
    if (useToken != null && useToken) {
      await _getToken();
    } else {
      _headersOption = ConfigServices.getHeaders();
    }

    try {
      switch (type) {
        case RequestType.GET:
          response = await _dio.get(url,
              options: _headersOption, queryParameters: params);
          break;
        case RequestType.POST:
          response = await _dio.post(url,
              data: data != null ? data : null,
              options: _headersOption,
              queryParameters: params);
          break;

        case RequestType.PUT:
          response = await _dio.put(url,
              data: data != null ? data : null,
              options: _headersOption,
              queryParameters: params);
          break;
        case RequestType.DELETE:
          response = await _dio.delete(url,
              data: data != null ? data : null,
              options: _headersOption,
              queryParameters: params);
          break;
      }
    } on DioError catch (e) {
      return e.response!.data;
    } catch (e) {
      print(e);
      return null;
    }

    print("URL: $url");
    print("Param: $params");
    print("Body: $data");
    print("Response: ${response.data}");
    //* Handling error and status code

    return response.data;
  }
}

class ConfigServices {
  static Options getHeaders({String token = ""}) {
    var _headers = Map<String, dynamic>();
    _headers['Accept'] = "application/json";

    if (token != '') {
      _headers["Authorization"] = "$token";
    }

    return Options(headers: _headers);
  }
}
