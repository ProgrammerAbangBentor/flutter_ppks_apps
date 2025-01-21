import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/api/requests/PengaduanApi.dart';
import 'package:flutter_ppks_apps/app/form_pengaduan/FormTerlaporScreen.dart';
import 'package:flutter_ppks_apps/core/models/PengaduanModel.dart';
import 'package:geolocator/geolocator.dart';

class FormPeristiwaScreen extends StatefulWidget {
  const FormPeristiwaScreen({super.key});

  @override
  State<FormPeristiwaScreen> createState() => _FormPeristiwaScreenState();
}

class _FormPeristiwaScreenState extends State<FormPeristiwaScreen> {
  final _formKey = GlobalKey<FormState>();

  String? kategoriPengaduan;
  DateTime? tanggalPeristiwa;
  String? kronologi;
  Position? currentPosition;
  String lokasiManual = '';
  List<dynamic> kategoriList = []; 

  @override
  void initState() {
    super.initState();
    _fetchKategoriPengaduan();
  }

  // Fetch data kategori pengaduan dari API
  Future<void> _fetchKategoriPengaduan() async {
    try {
      final categories = await PengaduanApi.getKategoriPengaduan();
      setState(() {
        kategoriList = categories.map((e) => e.toJson()).toList(); // Konversi ke Map
      });
    } catch (e) {
      print('Error fetching categories: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat kategori pengaduan. Silakan coba lagi.')),
      );
    }
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aktifkan layanan lokasi untuk melanjutkan')),
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Izin lokasi ditolak')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Izin lokasi ditolak secara permanen')),
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentPosition = position;
    });
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        tanggalPeristiwa = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pengaduan PPKS'),
        backgroundColor: const Color.fromARGB(255, 98, 8, 114),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    '(Pencegahan dan Penanganan Kekerasan Seksual)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(225, 0, 0, 0),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  'Peristiwa',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Pilihan Kategori Pengaduan
               kategoriList.isEmpty
                ? kategoriPengaduan == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Text(
                        'Gagal memuat kategori. Coba refresh.',
                        style: TextStyle(color: Colors.red),
                      )
                : DropdownButtonFormField<String>(
                    value: kategoriPengaduan,
                    decoration: InputDecoration(
                      labelText: 'Kategori Pengaduan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: kategoriList.map((kategori) {
                      return DropdownMenuItem<String>(
                        value: kategori['id'].toString(),
                        child: Text(kategori['name']),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => kategoriPengaduan = value),
                    validator: (value) => value == null ? 'Kategori pengaduan harus diisi' : null,
                  ),
                const SizedBox(height: 16),

                // Tanggal Peristiwa
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: tanggalPeristiwa == null
                        ? 'Tanggal Peristiwa'
                        : 'Tanggal: ${tanggalPeristiwa!.toLocal()}'.split(' ')[0],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onTap: _selectDate,
                ),
                const SizedBox(height: 16),

                // Kronologi Peristiwa
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Kronologi Peristiwa',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => kronologi = value,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Kronologi harus diisi' : null,
                ),
                const SizedBox(height: 16),

                // Lokasi Peristiwa
                const Text(
                  'Lokasi Peristiwa',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),

                // Bagikan Lokasi
                ElevatedButton.icon(
                  onPressed: _getCurrentLocation,
                  icon: const Icon(Icons.my_location),
                  label: const Text('Bagikan Lokasi Saat Ini'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),

                // Tampilkan Lokasi
                if (currentPosition != null)
                  Text(
                    'Lokasi Anda: (${currentPosition!.latitude}, ${currentPosition!.longitude})',
                    style: const TextStyle(fontSize: 14),
                  ),
                const SizedBox(height: 16),

                // Lokasi Manual
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Atau masukkan lokasi manual',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => lokasiManual = value,
                ),
                const SizedBox(height: 16),

                // Unggah File Bukti
                const Text(
                  'Unggah File Bukti Tindak Kekerasan Seksual',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    // Logika unggah file
                  },
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Unggah File'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),

                // Tombol Berikutnya
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        PengaduanModel pengaduan = PengaduanModel(
                          pelapor: 'Pelapor', // Sesuaikan dengan data yang dimasukkan
                          jenisIdentitas: 'KTP', // Sesuaikan dengan data yang dimasukkan
                          noIdentitas: '123456789', // Sesuaikan dengan data yang dimasukkan
                          kategoriPengaduanId: int.parse(kategoriPengaduan!),
                          tanggalPeristiwa: tanggalPeristiwa.toString(),
                          kronologiPeristiwa: kronologi ?? '',
                          latitude: currentPosition?.latitude ?? 0.0,
                          longitude: currentPosition?.longitude ?? 0.0,
                          kategoriPelapor: 'Mahasiswa', // Sesuaikan
                          fileBukti: null, // Sesuaikan jika ada file yang diupload
                        );
                        // Kirim pengaduan
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FormTerlapor()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 98, 8, 114),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Berikutnya',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
