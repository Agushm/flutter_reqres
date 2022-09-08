part of 'repository.dart';

class UserRepo extends DioClient {
  static UserRepo instance = UserRepo();

  Future<User?> getUser({required String id}) async {
    User? user;
    try {
      var res = await request(baseUrl + '/users/$id', RequestType.GET);
      user = User.fromJson(res.data);
    } catch (e) {
      print(e);
    }
    return user;
  }

  Future<dynamic> getUsers() async {
    try {
      var res = await request(baseUrl + '/users', RequestType.GET);
      return res;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> createUser({required Map<String, dynamic>? data}) async {
    try {
      var res = await request(
        baseUrl + '/users',
        RequestType.POST,
        data: json.encode(data),
      );
      return res;
    } catch (e) {
      return null;
    }
  }
}
