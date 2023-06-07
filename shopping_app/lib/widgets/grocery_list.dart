import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shopping_app/data/categories.dart';

import 'package:shopping_app/models/grocery_item.dart';
import 'package:shopping_app/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => const NewItem(),
      ),
    );

    if (newItem == null) return;

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _loadItem() async {
    final url = Uri.https('example.com', 'shopping-list.json');
    final List<GroceryItem> loadedItems = [];
    try {
      final response = await http.get(url);

      final Map<String, dynamic> listData = json.decode(response.body);

      for (final item in listData.entries) {
        final category = categories.entries
            .firstWhere((c) => c.value.title == item.value['category'])
            .value;
        loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ));
      }

      setState(() {
        _groceryItems = loadedItems;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (ctx, index) => ListTile(
                title: Text(_groceryItems[index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _groceryItems[index].category.color,
                ),
                trailing: Text(
                  _groceryItems[index].quantity.toString(),
                ),
              ),
            ),
    );
  }
}
