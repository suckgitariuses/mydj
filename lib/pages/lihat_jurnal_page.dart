import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/jurnal.dart';
import '../data/data_provider.dart';

class LihatJurnalPage extends StatefulWidget {
  const LihatJurnalPage({super.key});
  final String title = 'Lihat Jurnal';

  @override
  State<LihatJurnalPage> createState() {
    return _LihatJurnalPageState();
  }
}

class _LihatJurnalPageState extends State<LihatJurnalPage> {
  @override
  Widget build(BuildContext context) {
    final List<Jurnal> daftarJurnal = context.watch<DataProvider>().jurnalTersimpan;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  title: Text(daftarJurnal[index].kelas),
                  subtitle: Text(daftarJurnal[index].mapel),
                  trailing: Text(daftarJurnal[index].createdAt.toString()),
                  onTap: () {},
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: daftarJurnal.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
