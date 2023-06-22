import 'package:flutter/material.dart';
import 'package:webview_app/tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tabs = ['Activity', 'Reward'];

  @override
  Widget build(BuildContext context) {
    final lists = List.generate(100, (i) => 1 + i++);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Sample'),
      ),
      body: TabBarWidget(
        onChangedIndex: (index) {
          print('$index');
        },
        tabs: tabs,
        tabViews: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: lists.length,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.notifications_active),
                          Text(
                            '1hours ago',
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'example',
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'example',
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Center(
            child: Text("It's rainy here"),
          ),
        ],
      ),
    );
  }
}
