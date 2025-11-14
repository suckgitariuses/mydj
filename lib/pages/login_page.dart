import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart'; // ✅ pastikan path sesuai
import 'package:mydj/pages/simple_home_page.dart';   // ✅ halaman tujuan setelah login

class LoginPage extends StatefulWidget {
  final String title = 'MyDJ - Welcome';
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String namaPengguna = ''; // Menyimpan username
  String sandi = '';        // Menyimpan password

  // Fungsi sederhana untuk proses login
  void _login() {
    if (namaPengguna.isEmpty || sandi.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username dan password tidak boleh kosong")),
      );
      return;
    }

    // Contoh validasi sederhana
    if (namaPengguna == "admin" && sandi == "12345") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleHomePage(title: 'MyDJ Home'),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login berhasil!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username atau password salah")),
      );
    }
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/login_icon.jpg',
                  width: 250,
                ),
                const SizedBox(height: 30),
                const Text(
                  "Selamat Datang di MyDJ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Field Username
                TextField(
                  decoration: const InputDecoration(
                    labelText: "Nama Pengguna",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      namaPengguna = value;
                    });
                  },
                ),
                const SizedBox(height: 20),

                // 🔹 Field Password (gunakan widget buatanmu)
                PasswordField(
                  onChanged: (value) {
                    setState(() {
                      sandi = value;
                    });
                  },
                ),
                const SizedBox(height: 30),

                // 🔹 Tombol Login
                ElevatedButton.icon(
                  onPressed: _login,
                  icon: const Icon(Icons.login),
                  label: const Text("Login"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
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
