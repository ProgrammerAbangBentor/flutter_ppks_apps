import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/app/form_pengaduan/form_pengaduan.dart';
import 'package:flutter_ppks_apps/app/profile_secreen.dart';
import 'package:flutter_ppks_apps/app/status_pengaduan_screen.dart';
import 'package:flutter_ppks_apps/core/models/login_view_model.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Satgas PPKS Poltekgo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selamat Datang di Aplikasi PPKS Poltekgo',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Selamat Datang',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                loginViewModel.userName ?? 'Pengguna', 
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FormPengaduanPage()),
                  );
                  print('Buat Pengaduan');
                },
                child: const Text('Buat Pengaduan'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StatusPengaduanScreen()),
                  );
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
              icon: Icon(Icons.home, color: Color.fromARGB(255, 61, 61, 61)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box, color: Color.fromARGB(255, 61, 61, 61)),
              label: 'Buat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_rounded,
                  color: Color.fromARGB(255, 61, 61, 61)),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Color.fromARGB(255, 61, 61, 61)),
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
                  MaterialPageRoute(
                      builder: (context) => const FormPengaduanPage()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StatusPengaduanScreen()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
                break;
            }
          },
        ),
      ),
    );
  }
}
