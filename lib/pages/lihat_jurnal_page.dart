import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/data_provider.dart';
import '../data/jurnal.dart';

class LihatJurnalPage extends StatefulWidget {
  final String title;
  const LihatJurnalPage({super.key, required this.title});

  @override
  State<LihatJurnalPage> createState() => _LihatJurnalPageState();
}

class _LihatJurnalPageState extends State<LihatJurnalPage> {
  @override
  Widget build(BuildContext context) {
    final List<Jurnal> daftarJurnal =
        context.watch<DataProvider>().jurnalTersimpan;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: daftarJurnal.isEmpty
            ? const Center(
          child: Text(
            'Belum ada jurnal disimpan.',
            style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
        )
            : ListView.separated(
          itemBuilder: (context, index) => ListTile(
            leading: const Icon(Icons.book),
            title: Text(daftarJurnal[index].kelas),
            subtitle: Text(daftarJurnal[index].mapel),
            trailing: Text(
              daftarJurnal[index].createdAt.toString(),
              style: const TextStyle(fontSize: 12),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: daftarJurnal.length,
        ),
      ),
    );
  }
}
