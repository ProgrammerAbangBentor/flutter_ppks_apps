import 'dart:convert';

List<KategoriPengaduan> kategoriPengaduanFromJson(String str) =>
    List<KategoriPengaduan>.from(json.decode(str).map((x) => KategoriPengaduan.fromJson(x)));

String kategoriPengaduanToJson(List<KategoriPengaduan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KategoriPengaduan {
  final int id;
  final String name;

  KategoriPengaduan({
    required this.id,
    required this.name,
  });

  factory KategoriPengaduan.fromJson(Map<String, dynamic> json) {
    return KategoriPengaduan(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
