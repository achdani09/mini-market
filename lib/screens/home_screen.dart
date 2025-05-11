import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onToggleTheme;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _produkList = [];

  void _addProduk() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _produkList.add(text);
        _controller.clear();
      });
    }
  }
  
  void _removeProduk(int index) {
    setState(() {
      _produkList.removeAt(index);
    });
  }

  void _navigateToKategori() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => KategoriScreen(produkList: _produkList),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Market ToDo'),
        actions: [
          Row(
            children: [
              const Icon(Icons.light_mode),
              Switch(
                value: widget.isDarkMode,
                onChanged: widget.onToggleTheme,
              ),
              const Icon(Icons.dark_mode),
            ],
          ),
        ],
      ),
            body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Masukkan Nama Produk',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addProduk,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _produkList.isEmpty ? null : _navigateToKategori,
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Lihat Kategori Belanja'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _produkList.length,
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.check_box_outline_blank),
                  title: Text(_produkList[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeProduk(index), // Hapus produk
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}