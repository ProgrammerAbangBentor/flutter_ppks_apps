class PengaduanModel {
  final String pelapor;
  final String jenisIdentitas;
  final String noIdentitas;
  final int kategoriPengaduanId;
  final String tanggalPeristiwa;
  final String kronologiPeristiwa;
  final double latitude;
  final double longitude;
  final String? fileBukti;
  final String kategoriPelapor;
  final String? namaTersangka;
  final String? statusTersangka;
  final String? noTelfonTersangka;

  PengaduanModel({
    required this.pelapor,
    required this.jenisIdentitas,
    required this.noIdentitas,
    required this.kategoriPengaduanId,
    required this.tanggalPeristiwa,
    required this.kronologiPeristiwa,
    required this.latitude,
    required this.longitude,
    this.fileBukti,
    required this.kategoriPelapor,
    this.namaTersangka,
    this.statusTersangka,
    this.noTelfonTersangka,
  });

  Map<String, dynamic> toJson() {
    return {
      'pelapor': pelapor,
      'jenis_identitas': jenisIdentitas,
      'no_identitas': noIdentitas,
      'kategori_pengaduan_id': kategoriPengaduanId,
      'tanggal_peristiwa': tanggalPeristiwa,
      'kronologi_peristiwa': kronologiPeristiwa,
      'latitude': latitude,
      'longitude': longitude,
      'file_bukti': fileBukti,
      'kategori_pelapor': kategoriPelapor,
      'nama_tersangka': namaTersangka,
      'status_tersangka': statusTersangka,
      'no_telfon_tersangka': noTelfonTersangka,
    };
  }
}
