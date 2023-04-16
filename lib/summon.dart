import 'package:flutter/material.dart';
import 'list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SummonPage extends StatefulWidget {
  @override
  _SummonPageState createState() => _SummonPageState();
}

class _SummonPageState extends State<SummonPage> {
  List<ListItem> _selectedItems = [];

  void _onItemChecked(bool? value, ListItem item) {
    setState(() {
      if (value != null && value) {
        if (_selectedItems.length < 5) {
          _selectedItems.add(item);
        }
      } else {
        _selectedItems.remove(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('コンテンツ選択'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isChecked = _selectedItems.contains(item);
          return CheckboxListTile(
            value: isChecked,
            onChanged: (value) {
              _onItemChecked(value, item);
            },
            title: Text(item.title),
            secondary: Image.network(item.imageUrl),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, _selectedItems);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
