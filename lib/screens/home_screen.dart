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