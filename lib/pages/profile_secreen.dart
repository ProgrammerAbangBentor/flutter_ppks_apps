import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/pages/dashboard_page.dart';
import 'package:flutter_ppks_apps/pages/form_pengaduan.dart';
import 'package:flutter_ppks_apps/pages/login_page.dart';
import 'package:flutter_ppks_apps/pages/status_pengaduan_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nirfanto Hutuji',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Prodi Teknik Informatika'),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Ubah Password'),
              onTap: () {
                // Navigasi ke halaman ubah password
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Biodata'),
              onTap: () {
                // Navigasi ke halaman biodata
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: Text('Keluar'),
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
    );
  }
}