import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';
import 'package:mydj/pages/simple_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  final String title = 'MyDJ - Welcome';

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String namaPengguna = '';
  String sandi = '';

  void login(BuildContext context) {
    if (namaPengguna == 'guru' && sandi == 'guru') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SimpleHomePage(title: 'Beranda')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau password salah'), backgroundColor: Colors.redAccent),
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
              children: [
                Image.asset('assets/images/login_icon.jpg', width: 200),
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Nama Pengguna'),
                  onChanged: (v) => namaPengguna = v,
                ),
                const SizedBox(height: 12),
                PasswordField(onChanged: (v) => sandi = v),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => login(context),
                    child: const Text('Login'),
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
