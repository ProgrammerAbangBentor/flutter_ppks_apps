import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ppks_apps/pages/dashboard_page.dart';
import 'package:flutter_ppks_apps/pages/form_pengaduan.dart';
import 'package:flutter_ppks_apps/pages/profile_secreen.dart';


class StatusPengaduanScreen extends StatefulWidget {
  const StatusPengaduanScreen({super.key});

  @override
  _StatusPengaduanScreenState createState() => _StatusPengaduanScreenState();
}

class _StatusPengaduanScreenState extends State<StatusPengaduanScreen> {
  List<FlSpot> dataPoints = [];

  @override
  void initState() {
    super.initState();
    _generateData();
  }

  void _generateData() {
    dataPoints = [
      FlSpot(0, 35),
      FlSpot(1, 28),
      FlSpot(2, 40),
      FlSpot(3, 32),
      FlSpot(4, 50),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Pengaduan'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ditingkatkan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            // Grafik sparkline menggunakan LineChart dari fl_chart
            SizedBox(
              height: 150,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.blue,
                      dotData: FlDotData(show: false),
                      spots: dataPoints,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue.withOpacity(0.3),
                      ),
                    ),
                  ],
                  titlesData: FlTitlesData(show: false),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Laporan Status',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            // Tambahkan widget lainnya untuk menampilkan laporan status
            const Text(
              'Jumlah laporan meningkat 20% dibandingkan bulan lalu.',
              style: TextStyle(fontSize: 14),
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
