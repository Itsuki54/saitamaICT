import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _fileName = 'initial_file_name.txt';

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(_fileName),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.drive_file_rename_outline),
              title: Text('Rename'),
              onTap: () {
                Navigator.pop(context);
                _showRenameDialog(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.copy),
              title: Text('Copy'),
              onTap: () {
                Navigator.pop(context);
                // Copy操作を実行
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete'),
              onTap: () {
                Navigator.pop(context);
                // Delete操作を実行
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Move'),
              onTap: () {
                Navigator.pop(context);
                // Move操作を実行
              },
            ),
          ],
        );
      },
    );
  }

  void _showRenameDialog(BuildContext context) {
    final TextEditingController _controller = TextEditingController(text: _fileName);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rename File'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter new file name',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _fileName = _controller.text;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showBottomSheet(context);
          },
          child: Text('Show Bottom Sheet'),
        ),
      ),
    );
  }
}
