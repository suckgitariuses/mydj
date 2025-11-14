import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';

class AkunPage extends StatefulWidget {
  final String title;
  const AkunPage({super.key, required this.title});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian Ganti Sandi
              const Text(
                'Ganti Sandi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(thickness: 2),
              const SizedBox(height: 10),

              const Text('Sandi Saat Ini'),
              const SizedBox(height: 10),

              // -----------------
              const PasswordField(), //
              // -----------------

              const SizedBox(height: 20),
              const Text('Sandi Baru'),
              const SizedBox(height: 10),
              const PasswordField(),
              const SizedBox(height: 20),
              const Text('Konfirmasi Sandi Baru'),
              const SizedBox(height: 10),
              const PasswordField(),

              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Fitur ubah sandi belum tersedia.'),
                      ),
                    );
                  },
                  child: const Text('Simpan Perubahan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
