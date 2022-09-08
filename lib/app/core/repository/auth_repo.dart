part of 'repository.dart';

class AuthRepo extends DioClient {
  static AuthRepo instance = AuthRepo();

  Future<dynamic> login(
      {required String email, required String password}) async {
    try {
      var res = await request(baseUrl + '/login', RequestType.POST,
          data: json.encode({"email": email, "password": password}));
      return res;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
