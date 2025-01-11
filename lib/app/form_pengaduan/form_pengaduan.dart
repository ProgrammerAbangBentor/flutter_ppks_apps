import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/app/form_pengaduan/form_peristiwa.dart';

class FormPengaduanPage extends StatelessWidget {
  const FormPengaduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 98, 8, 114),
        title: const Text('Form Pengaduan PPKS'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                '(Pencegahan dan Penanganan Kekerasan Seksual)',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 10, 10, 10),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Identitas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Nama Pelapor
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama Pelapor',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Jenis Identitas
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Jenis Identitas',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'KTM',
                  child: Text('Kartu Tanda Mahasiswa (KTM)'),
                ),
                DropdownMenuItem(
                  value: 'NIDN',
                  child: Text('Nomor Induk Dosen Nasional (NIDN)'),
                ),
              ],
              onChanged: (value) {
                // Aksi saat dropdown berubah
              },
            ),
            const SizedBox(height: 16),
            // Nomor Identitas
            TextField(
              decoration: InputDecoration(
                labelText: 'Nomor Identitas',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
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
            // Tanggal Peristiwa
            TextField(
              decoration: InputDecoration(
                labelText: 'Tanggal Peristiwa',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.datetime,
              onTap: () {
                // Aksi untuk memilih tanggal (gunakan date picker)
              },
            ),
            const SizedBox(height: 16),
            // Kronologi Peristiwa
            TextField(
              decoration: InputDecoration(
                labelText: 'Kronologi Peristiwa',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            // Tombol Berikutnya
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => const FormPeristiwaPage()));
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
    );
  }
}
