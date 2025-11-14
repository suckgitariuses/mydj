import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';

class AkunPage extends StatefulWidget {
  final String title;
  const AkunPage({super.key, required this.title});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  String currentPassword = '';
  String newPassword = '';
  String confirmPassword = '';

  void _saveNewPassword() {
    if (newPassword.isEmpty || confirmPassword.isEmpty || currentPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lengkapi semua field password.'), backgroundColor: Colors.redAccent),
      );
      return;
    }
    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Konfirmasi sandi tidak cocok.'), backgroundColor: Colors.redAccent),
      );
      return;
    }
    // Dummy: di praktikum ini kita tidak menyimpan password secara nyata.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sandi berhasil diubah.')),
    );
    // reset fields
    setState(() {
      currentPassword = '';
      newPassword = '';
      confirmPassword = '';
    });
  }

  void _logout() {
    // Keluar: pop sampai root atau navigasi ke LoginPage — panggil Navigator.popUntil
    Navigator.popUntil(context, (route) => route.isFirst);
    // kalau main mengarahkan login jadi initial, bisa pushReplacement ke LoginPage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Ganti Sandi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            const Text('Sandi Saat Ini'),
            const SizedBox(height: 10),
            PasswordField(onChanged: (v) => currentPassword = v),
            const SizedBox(height: 12),
            const Text('Sandi Baru'),
            const SizedBox(height: 10),
            PasswordField(onChanged: (v) => newPassword = v),
            const SizedBox(height: 12),
            const Text('Konfirmasi Sandi Baru'),
            const SizedBox(height: 10),
            PasswordField(onChanged: (v) => confirmPassword = v),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _saveNewPassword,
                    child: const Text('Simpan'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _logout,
                    child: const Text('Logout'),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
