import 'package:flutter/material.dart';

class FormTerlapor extends StatefulWidget {
  const FormTerlapor({super.key});

  @override
  _FormTerlaporState createState() => _FormTerlaporState();
}

class _FormTerlaporState extends State<FormTerlapor> {
  final _formKey = GlobalKey<FormState>();

  String _selectedPelaporStatus = 'Mahasiswa';
  String _selectedPelaporKategori = 'Korban';
  String _selectedTersangkaStatus = 'Mahasiswa';
  String? _namaTersangka;
  String? _noTelpTersangka;

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

                // Header Pelapor
                const Text(
                  'Pelapor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),

                // Dropdown Status Pelapor dan Kategori Pelapor
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedPelaporStatus,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedPelaporStatus = newValue!;
                          });
                        },
                        items: const [
                          DropdownMenuItem(value: 'Mahasiswa', child: Text('Mahasiswa')),
                          DropdownMenuItem(value: 'Dosen', child: Text('Dosen')),
                          DropdownMenuItem(
                              value: 'Staff Kampus', child: Text('Staff Kampus')),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Status Pelapor',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedPelaporKategori,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedPelaporKategori = newValue!;
                          });
                        },
                        items: const [
                          DropdownMenuItem(value: 'Korban', child: Text('Korban')),
                          DropdownMenuItem(
                              value: 'Pelapor/Saksi', child: Text('Pelapor/Saksi')),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Kategori Pelapor',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Header Tersangka
                const Text(
                  'Tersangka',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),

                // Input Nama Tersangka
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap Tersangka',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    _namaTersangka = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tersangka harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                // Dropdown Status Tersangka
                DropdownButtonFormField<String>(
                  value: _selectedTersangkaStatus,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedTersangkaStatus = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: 'Mahasiswa', child: Text('Mahasiswa')),
                    DropdownMenuItem(value: 'Dosen', child: Text('Dosen')),
                    DropdownMenuItem(
                        value: 'Staff Kampus', child: Text('Staff Kampus')),
                    DropdownMenuItem(value: 'Masyarakat', child: Text('Masyarakat')),
                    DropdownMenuItem(
                        value: 'Mahasiswa Kampus Lain',
                        child: Text('Mahasiswa Kampus Lain')),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Status Tersangka',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                // Input No Telepon Tersangka
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'No Telp Tersangka',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    _noTelpTersangka = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor telepon tersangka harus diisi';
                    }
                    if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return 'Nomor telepon harus berupa angka';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Tombol Kirim
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Implementasi pengiriman data pengaduan
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data berhasil dikirim')),
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
                    'Kirim',
                    style: TextStyle(fontSize: 16),
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
