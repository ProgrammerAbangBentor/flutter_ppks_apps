import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/app/form_pengaduan/FormPeristiwaScreen.dart';

class FormPengaduanScreen extends StatefulWidget {
  @override
  _FormPengaduanScreenState createState() => _FormPengaduanScreenState();
}

class _FormPengaduanScreenState extends State<FormPengaduanScreen> {
  final _formKey = GlobalKey<FormState>();

  String pelapor = "Anonim"; // Default pelapor
  String? jenisIdentitas; // Jenis Identitas (KTM/NIDN)
  String? noIdentitas; // Nomor Identitas
  String? kategoriPelapor; // Kategori Pelapor (Korban/Pelapor-Saksi)

  void _submitPengaduan(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Validasi berhasil, navigasi ke langkah berikutnya
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FormPeristiwaScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 98, 8, 114),
        title: const Text('Form Pengaduan PPKS - Step 1 | Data Pelapor'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
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
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 10, 10, 10),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Identitas Pelapor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Pilihan Pelapor
              DropdownButtonFormField<String>(
                value: pelapor,
                decoration: InputDecoration(
                  labelText: 'Pelapor',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'Mahasiswa', child: Text('Mahasiswa')),
                  DropdownMenuItem(value: 'Dosen', child: Text('Dosen')),
                  DropdownMenuItem(value: 'Anonim', child: Text('Anonim')),
                ],
                onChanged: (value) => setState(() => pelapor = value!),
              ),
              const SizedBox(height: 16),

              // Jenis Identitas
              DropdownButtonFormField<String>(
                value: jenisIdentitas,
                decoration: InputDecoration(
                  labelText: 'Jenis Identitas',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'KTM', child: Text('KTM')),
                  DropdownMenuItem(value: 'NIDN', child: Text('NIDN')),
                ],
                onChanged: (value) => setState(() => jenisIdentitas = value),
                validator: (value) =>
                    value == null ? 'Jenis Identitas harus diisi' : null,
              ),
              const SizedBox(height: 16),

              // Nomor Identitas
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nomor Identitas',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) => noIdentitas = value,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Nomor Identitas harus diisi' : null,
              ),
              const SizedBox(height: 16),

              // Kategori Pelapor
              DropdownButtonFormField<String>(
                value: kategoriPelapor,
                decoration: InputDecoration(
                  labelText: 'Kategori Pelapor',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 'Korban', child: Text('Korban')),
                  DropdownMenuItem(
                      value: 'Pelapor/Saksi', child: Text('Pelapor/Saksi')),
                ],
                onChanged: (value) => setState(() => kategoriPelapor = value),
                validator: (value) =>
                    value == null ? 'Kategori Pelapor harus diisi' : null,
              ),
              const SizedBox(height: 24),

              // Tombol Berikutnya
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () => _submitPengaduan(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 98, 8, 114),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                  ),
                  child: const Text('Berikutnya'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
