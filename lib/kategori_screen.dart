import 'package:flutter/material.dart';

class KategoriScreen extends StatelessWidget {
  final List<String> produkList;

  const KategoriScreen({super.key, required this.produkList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kategori Belanja')),
      body: produkList.isEmpty
          ? const Center(child: Text('Belum ada produk ditambahkan.'))
            : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: produkList.length,
              itemBuilder: (context, index) => Card(
                 elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(
                    produkList[index],
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: const Icon(Icons.check_box_outline_blank),
                ),
              ),
            ),
    );
  }
}
