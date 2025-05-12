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