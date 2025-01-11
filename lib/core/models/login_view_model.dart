import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/core/services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _userName;

  bool get isLoading => _isLoading;
  String? get userName => _userName;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    setLoading(true);

    try {
      final response = await _authService.login(email, password);
      return response.fold(
        (error) => {'status': false, 'message': error.toString()},
        (data)  {
          _userName = data.name;
          notifyListeners();
          return {'status': true, 'data': data};
        },
      );
    } catch (e) {
      return {'status': false, 'message': 'Gagal terhubung ke server: $e'};
    } finally {
      setLoading(false);
    }
  }
}
