import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/pages/form_pengaduan.dart';
import 'package:flutter_ppks_apps/pages/profile_secreen.dart';
import 'package:flutter_ppks_apps/pages/status_pengaduan_screen.dart';

class DashboardPage extends StatelessWidget {
 const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Satgas PPKS Poltekgo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selamat Datang di Aplikasi PPKS Poltekgo',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Selamat Datang',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Nirfanto',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => const FormPengaduanPage()));
                  print('Buat Pengaduan');
                },
                child: Text('Buat Pengaduan'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                   Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => const StatusPengaduanScreen()));
                  print('Status Pengaduan');
                },
                child: const Text('Status Pengaduan'),
              ),
            ],
          ),
        ),
           bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromARGB(255, 102, 3, 97)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box, color: Color.fromARGB(255, 102, 3, 97)),
              label: 'Buat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_rounded, color: Color.fromARGB(255, 102, 3, 97)),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color:  Color.fromARGB(255, 102, 3, 97)),
              label: 'Profil',
            ),
          ],
          onTap: (int index) {
            // Navigasi antar halaman
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardPage()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormPengaduanPage()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StatusPengaduanScreen()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
                break;
            }
          },
        ),
      ),
    );
  }
}