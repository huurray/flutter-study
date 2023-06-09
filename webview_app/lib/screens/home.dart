import 'package:flutter/material.dart';
import 'package:webview_app/screens/webview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '홈페이지',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const WebviewScreen(
                      url: 'https://flutter.dev',
                    ),
                  ),
                );
              },
              child: const Text(
                '웹뷰로 가기',
              ),
            )
          ],
        ),
      ),
    );
  }
}
