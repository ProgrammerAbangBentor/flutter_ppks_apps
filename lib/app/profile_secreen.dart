import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/app/dashboard_page.dart';
import 'package:flutter_ppks_apps/app/form_pengaduan/form_pengaduan.dart';
import 'package:flutter_ppks_apps/app/status_pengaduan_screen.dart';
import 'package:flutter_ppks_apps/core/models/login_view_model.dart';
import 'package:flutter_ppks_apps/core/models/logout_view_model.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logoutViewModel = Provider.of<LogoutViewModel>(context);
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              loginViewModel.userName ?? 'Pengguna', 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Prodi Teknik Informatika'),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.lock),
              title:
                Text('Ubah Password',
                  style: TextStyle(fontSize: 15,  ),
                ),
              onTap: () {
                // Navigasi ke halaman ubah password
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: 
                Text('Pengaturan Akun',
                  style: TextStyle(fontSize: 15,  ),
                ),
              onTap: () {
                // Navigasi ke halaman biodata
              },
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: logoutViewModel.isLoading 
              ? null : () {
                logoutViewModel.logout(context);
              },
              child: logoutViewModel.isLoading ? const CircularProgressIndicator(color: Colors.purple)
              : const Text('Keluar'),
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
              icon: Icon(Icons.fact_check_rounded, color: Color.fromARGB(255, 61, 61, 61)),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color:  Color.fromARGB(255, 61, 61, 61)),
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
    );
  }
}