import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/pages/form_terlapor.dart';

class FormPeristiwaPage extends StatelessWidget {
  const FormPeristiwaPage({super.key});

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
              // Section Peristiwa
              const Text(
                'Peristiwa',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Input Lokasi Peristiwa
              const Text('Lokasi Peristiwa', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan lokasi peristiwa',
                ),
              ),
              const SizedBox(height: 16),
              // Peta Lokasi (Dummy)
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    Icons.map,
                    size: 100,
                    color: Colors.grey[400],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Unggah File Bukti
              const Text(
                'Unggah File bukti tindak kekerasan seksual',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'Max file size: 50.00 MB | Allowed file types: gif,jpeg,png,jpg,pdf,zip,rar\nMin number of file: 1',
                style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Tombol Berikutnya
              Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                    Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => const FormTerlapor()));
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
        
    );
  }
}
