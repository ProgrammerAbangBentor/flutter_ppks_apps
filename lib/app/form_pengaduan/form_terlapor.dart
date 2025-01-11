import 'package:flutter/material.dart';

class FormTerlapor extends StatefulWidget {
  const FormTerlapor({super.key});

  @override
  _FormTerlaporState createState() => _FormTerlaporState();
}

class _FormTerlaporState extends State<FormTerlapor> {
  String _selectedPelaporStatus = 'Mahasiswa';
  String _selectedPelaporKategori = 'Korban';
  String _selectedTersangkaStatus = 'Mahasiswa';

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pengaduan PPKS'),
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
            
            const Text(
              'Pelapor',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
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
                    items: <String>['Mahasiswa', 'Dosen', 'Staff Kampus']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              // Header Form
              const Center(
                child: Text(
                  '(Pencegahan dan Penanganan Kekerasan Seksual)',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(225, 0, 0, 0),
                  ),
                ),
              ),         
                SizedBox(width: 20),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedPelaporKategori,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPelaporKategori = newValue!;
                      });
                    },
                    items: <String>['Korban', 'Pelapor/Saksi']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Tersangka',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nama Lengkap Tersangka',
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedTersangkaStatus,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTersangkaStatus = newValue!;
                });
              },
              items: <String>['Mahasiswa', 'Dosen', 'Staff Kampus', 'Masyarakat Umum']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'No Telp Tersangka',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementasi pengiriman data pengaduan
              },
              child: Text('Kirim'),
            ),
          ],
        ),
      ),
    ),
  );
  }
}