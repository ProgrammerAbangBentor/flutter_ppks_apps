import 'dart:convert';
import 'package:flutter_ppks_apps/api/responses/KategoriPengaduanResponses.dart';
import 'package:http/http.dart' as http;

class PengaduanApi {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static Future<http.Response> submitPengaduan(Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/pengaduan');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<KategoriPengaduan>> getKategoriPengaduan() async {
    final url = Uri.parse('$baseUrl/kategori');
    try {
      final response = await http.get(url);
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        return data.map((kategori) => KategoriPengaduan.fromJson(kategori)).toList();
      } else {
        throw Exception('Gagal memuat kategori pengaduan: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }



}
