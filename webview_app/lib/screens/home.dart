import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:webview_app/checkbox_widget.dart';
import 'package:webview_app/gradient_text_widget.dart';
import 'package:webview_app/screens/webview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _checked = false;

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
            CheckBoxWidget(
              width: double.infinity,
              value: _checked,
              text: '123123',
              onChanged: (v) {
                setState(() {
                  _checked = v;
                });
              },
              required: true,
              backgroundColor: Colors.black26,
              action: IconButton(
                icon: const Icon(Icons.abc),
                onPressed: () {},
              ),
            ),
            const GradientText(
              text: 'Hello Flutter',
              style: TextStyle(fontSize: 40),
              gradient: LinearGradient(colors: [
                Colors.pink,
                Colors.purple,
                Colors.deepPurple,
                Colors.indigo,
                Colors.lightGreen,
                Colors.orange,
                Colors.deepOrange,
              ]),
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff7AEBF2),
                    Color(0xff9887FE),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const WebviewScreen(
                        url: 'http://192.168.122.231:3009/bungaecare',
                      ),
                    ),
                  );
                },
                child: const Text(
                  '웹뷰로 가기',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: const GradientBoxBorder(
                  gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: const [8, 3],
              radius: const Radius.circular(60),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(60)),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Transform.translate(
                      offset: const Offset(0, 2),
                      child: const TextField(
                        cursorHeight: 20,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Invalid input'),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('next'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Text('다이얼로그'),
            )
          ],
        ),
      ),
    );
  }
}
