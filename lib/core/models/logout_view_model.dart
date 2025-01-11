import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/core/services/auth_service.dart';

class LogoutViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> logout(BuildContext context) async {
    setLoading(true);

    try {
      await AuthService().logout();
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout gagal: $e')),
      );
    } finally {
      setLoading(false);
    }
  }
}
