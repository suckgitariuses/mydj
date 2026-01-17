import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/data_provider.dart';
import '../data/jurnal.dart';
// import 'package:mydj/components/media_selector.dart';

class BuatJurnalPage extends StatefulWidget {
  final String title = 'Buat Jurnal';
  const BuatJurnalPage({super.key});

  @override
  State<BuatJurnalPage> createState() {
    return _BuatJurnalPageState();
  }
}

class _BuatJurnalPageState extends State<BuatJurnalPage> {
  // variabel untuk menyimpan input
  String kelas = '';
  String mapel = '';
  int jamKe = 0;
  String tujuanPembelajaran = '';
  String materiTopikPembelajaran = '';
  String kegiatanPembelajaran = '';
  String dimensiProfilPelajarPancasila = '';
  String _jamTerpilih = '1'; // nilai default untuk dropdown jam ke-

  // Fungsi untuk membuat input TextField
  Widget buildTextField(String label, int maxLines) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(label),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Masukkan $label',
          ),
          maxLines: maxLines,
          onChanged: (value) => {
            // Logika penyimpanan data bisa ditaruh di sini
          },
        ),
      ],
    );
  }

  Widget _textArea(
    String label,
    String hint,
    void Function(String text) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: hint,
          ),
          maxLines: 4,
          onChanged: onChanged,
        ),
      ],
    );
  }

  void _saveJurnal(BuildContext context) {
    Jurnal jurnal = Jurnal(
      kelas: kelas,
      mapel: mapel,
      jam: jamKe,
      tujuanPembelajaran: tujuanPembelajaran,
      materiTopikPembelajaran: materiTopikPembelajaran,
      kegiatanPembelajaran: kegiatanPembelajaran,
      dimensiProfilPelajarPancasila: dimensiProfilPelajarPancasila,
    );
    DataProvider provider = context.read<DataProvider>();
    provider.addNew(jurnal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Input Kelas ---
              const Text('Kelas:'),
              const SizedBox(height: 10), // Jeda 10 unit
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Kelas',
                ),
                onChanged: (value) => {
                  setState(() {
                    kelas = value;
                  }),
                },
              ),

              // --- Input Nama Mapel ---
              const SizedBox(height: 10), // Jarak dari komponen di atasnya
              const Text('Nama Mapel'),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Nama Mapel',
                ),
                onChanged: (value) => {
                  setState(() {
                    mapel = value;
                  }),
                },
              ),
              // -- Input Jam ke- (Dropdown)
              const SizedBox(height: 10), // Jarak dari komponen di atasnya
              const Text('Jam Ke-'),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _jamTerpilih, // menggunakan variabe dengan tampilan
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pilih Jam',
                ),
                items: [
                  DropdownMenuItem(value: '1', child: Text('1')),
                  DropdownMenuItem(value: '2', child: Text('2')),
                  DropdownMenuItem(value: '3', child: Text('3')),
                  DropdownMenuItem(value: '4', child: Text('4')),
                  DropdownMenuItem(value: '5', child: Text('5')),
                  DropdownMenuItem(value: '6', child: Text('6')),
                  DropdownMenuItem(value: '7', child: Text('7')),
                  DropdownMenuItem(value: '8', child: Text('8')),
                ],
                onChanged: (value) {
                  // memperbarui state ketika pilihan berubah
                  setState(() {
                    _jamTerpilih = value!;
                    jamKe = int.parse(value);
                  });
                },
              ),
              // --- Input Tujuan Pembelajaran ---
              const SizedBox(height: 10),
              _textArea(
                'Tujuan Pembelajaran',
                'Masukkan Tujuan Pembelajaran',
                (value) => setState(() {
                  tujuanPembelajaran = value;
                }),
              ),
              const SizedBox(height: 10),
              _textArea(
                'Materi/Topik Pembelajaran',
                'Masukkan Materi/Topik Pembelajaran',
                (value) => setState(() {
                  materiTopikPembelajaran = value;
                }),
              ),
              const SizedBox(height: 10),
              _textArea(
                'Kegiatan Pembelajaran',
                'Masukkan Kegiatan Pembelajaran',
                (value) => setState(() {
                  kegiatanPembelajaran = value;
                }),
              ),
              const SizedBox(height: 10),
              _textArea(
                'Dimensi Profil Pelajar Pancasila',
                'Tuliskan Dimensi Profil Pelajar Pancasila',
                (value) => setState(() {
                  dimensiProfilPelajarPancasila = value;
                }),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _saveJurnal(context),
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
