import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/data_provider.dart';
import '../data/jurnal.dart';
import 'package:mydj/components/media_selector.dart';

class BuatJurnalPage extends StatefulWidget {
  final String title;
  const BuatJurnalPage({super.key, required this.title});

  @override
  State<BuatJurnalPage> createState() => _BuatJurnalPageState();
}

class _BuatJurnalPageState extends State<BuatJurnalPage> {
  // State untuk setiap input
  String kelas = '';
  String mapel = '';
  int jamKe = 0;
  String tujuanPembelajaran = '';
  String materiTopikPembelajaran = '';
  String kegiatanPembelajaran = '';
  String dimensiProfilPelajarPancasila = '';

  // Fungsi simpan jurnal
  void _saveJurnal(BuildContext context) {
    if (kelas.isEmpty || mapel.isEmpty || jamKe == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lengkapi data wajib: kelas, mapel, dan jam ke!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    Jurnal jurnal = Jurnal(
      kelas: kelas,
      mapel: mapel,
      jam: jamKe,
      tujuanPembelajaran: tujuanPembelajaran,
      materiTopikPembelajaran: materiTopikPembelajaran,
      kegiatanPembelajaran: kegiatanPembelajaran,
      dimensiProfilPelajarPancasila: dimensiProfilPelajarPancasila,
    );

    context.read<DataProvider>().addNew(jurnal);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Jurnal berhasil disimpan!')),
    );
  }

  // Helper textarea
  Widget _textArea(String label, String hint, void Function(String text) onChanged) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Kelas:'),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan Kelas',
              ),
              onChanged: (value) => setState(() => kelas = value),
            ),

            const SizedBox(height: 10),
            const Text('Nama Mapel'),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan Nama Mapel',
              ),
              onChanged: (value) => setState(() => mapel = value),
            ),

            const SizedBox(height: 10),
            const Text('Jam Ke-'),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pilih Jam',
              ),
              value: jamKe == 0 ? null : jamKe.toString(),
              items: List.generate(
                8,
                    (i) => DropdownMenuItem(
                  value: '${i + 1}',
                  child: Text('${i + 1}'),
                ),
              ),
              onChanged: (value) => setState(() => jamKe = int.parse(value ?? '0')),
            ),

            const SizedBox(height: 10),
            _textArea(
              'Tujuan Pembelajaran',
              'Masukkan Tujuan Pembelajaran',
                  (text) => tujuanPembelajaran = text,
            ),

            const SizedBox(height: 10),
            _textArea(
              'Materi/Topik Pembelajaran',
              'Masukkan Materi/Topik Pembelajaran',
                  (text) => materiTopikPembelajaran = text,
            ),

            const SizedBox(height: 10),
            _textArea(
              'Kegiatan Pembelajaran',
              'Masukkan Kegiatan Pembelajaran',
                  (text) => kegiatanPembelajaran = text,
            ),

            const SizedBox(height: 10),
            _textArea(
              'Dimensi Profil Pelajar Pancasila',
              'Tuliskan Dimensi Profil Pelajar Pancasila',
                  (text) => dimensiProfilPelajarPancasila = text,
            ),

            const SizedBox(height: 20),
            const Text(
              'Foto Kegiatan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const MediaSelector(mediaType: MediaType.photo),

            const SizedBox(height: 20),
            const Text(
              'Video Kegiatan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const MediaSelector(mediaType: MediaType.video),

            const SizedBox(height: 20),
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
    );
  }
}
