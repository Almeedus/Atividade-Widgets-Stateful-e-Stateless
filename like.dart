import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LikeButtonPage(),
    );
  }
}

class LikeButtonPage extends StatefulWidget {
  const LikeButtonPage({super.key});

  @override
  State<LikeButtonPage> createState() => _LikeButtonPageState();
}

class _LikeButtonPageState extends State<LikeButtonPage> {
  int _likes = 0;

  void _incrementLikes() {
    setState(() {
      _likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Botão de Curtir')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.pink, size: 32),
              onPressed: _incrementLikes,
            ),
            const SizedBox(width: 8),
            Text(
              '$_likes',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
