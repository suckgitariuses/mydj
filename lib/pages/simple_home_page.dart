import 'package:flutter/material.dart';
import 'package:mydj/pages/lihat_jurnal_page.dart';
import 'package:mydj/pages/buat_jurnal_page.dart';
import 'package:mydj/pages/akun_page.dart';
import 'package:mydj/pages/tentang_aplikasi_page.dart';
// import 'package:mydj/pages/login_page.dart';

class SimpleHomePage extends StatefulWidget {
  const SimpleHomePage({super.key, required this.title});

  final String title;

  @override
  State<SimpleHomePage> createState() => _SimpleHomePageState();
}

class _SimpleHomePageState extends State<SimpleHomePage> {
  // Fungsi untuk membuka halaman Lihat Jurnal
  void _openLihatJurnalPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LihatJurnalPage(),
      ),
    );
  }

  // Fungsi untuk membuka halaman Buat Jurnal
  void _openBuatJurnalPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BuatJurnalPage(),
      ),
    );
  }

  // Fungsi untuk membuka halaman Akun
  void _openAkunPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AkunPage(title: 'Akun'),
      ),
    );
  }

  // fungsi untuk membuka halaman tentang aplikasi
  void _openTentangAplikasiPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
        const TentangAplikasiPage(title: 'Tentang Aplikasi'),
      ),
    );
  }

  // // fungsi untuk membuka halaman login
  // void _LoginPageState(BuildContext context) {
  //   if (namaPengguna == 'guru' && sandi == 'guru') {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => SimpleHomePage(title: 'Beranda'),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Kemdikbud di atas
            Image.asset(
              'assets/images/logo_kemdikbud.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 40),

            // Baris pertama: Lihat & Buat Jurnal
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _openLihatJurnalPage(context),
                  child: const Text('Lihat Jurnal'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _openBuatJurnalPage(context),
                  child: const Text('Buat Jurnal'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Baris kedua: Akun & Tentang Aplikasi
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _openAkunPage(context),
                  child: const Text('Akun'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _openTentangAplikasiPage(context),
                  child: const Text('Tentang Aplikasi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
