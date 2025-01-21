import 'package:dartz/dartz.dart';
import 'package:flutter_ppks_apps/api/responses/auth_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _baseUrl = 'http://10.0.2.2:8000/api/login';

  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
   final response = await http.post(Uri.parse(_baseUrl),
    body: {'email': email, 'password': password});
    
    if (response.statusCode == 200) {
      final authResponse = AuthResponseModel.fromJson(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', authResponse.token);

      return right(authResponse);
    } else {
      return left(response.body);
    }
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

   Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

}
