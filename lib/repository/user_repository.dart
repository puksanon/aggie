import 'package:aggie/constant.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  final http.Client httpClient = http.Client();
  final Uri _singInUrl = Uri.parse('$apiEndpoint/auth/signin');
  final Uri _singUpUrl = Uri.parse('$apiEndpoint/auth/signup');

  Future<http.Response> singIn(String email, String password) async {
    Map<String, dynamic> reqBody = {'email': email, 'password': password};
    try {
      return await httpClient.post(this._singInUrl, body: reqBody);
    } catch (e) {
      print(e);
    }
  }
}
