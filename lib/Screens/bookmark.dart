import 'package:flutter/material.dart';

class Item {
  final int id;
  final String title;

  Item({required this.id, required this.title});
}

class BookmarkScreen extends StatefulWidget {
  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  List<Item> items = [
    Item(id: 1, title: 'Sports 1'),
    Item(id: 2, title: 'Sports 2'),
    Item(id: 3, title: 'Sports 3'),
    Item(id: 4, title: 'Sports 4'),
  ];

  List<Item> bookmarkedItems = [];

  void toggleBookmark(int itemId) {
    setState(() {
      final index = bookmarkedItems.indexWhere((item) => item.id == itemId);
      if (index == -1) {
        final item = items.firstWhere((item) => item.id == itemId);
        bookmarkedItems.add(item);
      } else {
        confirmRemoveBookmark(itemId);
      }
    });
  }

  void confirmRemoveBookmark(int itemId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm'),
          content:
              Text('Are you sure you want to remove this item from bookmarks?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Remove'),
              onPressed: () {
                removeBookmark(itemId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void removeBookmark(int itemId) {
    setState(() {
      final index = bookmarkedItems.indexWhere((item) => item.id == itemId);
      bookmarkedItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmark Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'All Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index].title),
                  trailing: IconButton(
                    icon: Icon(
                      bookmarkedItems.any((i) => i.id == items[index].id)
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: bookmarkedItems.any((i) => i.id == items[index].id)
                          ? Colors.blue
                          : Colors.blue,
                    ),
                    onPressed: () => toggleBookmark(items[index].id),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Bookmarked Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bookmarkedItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(bookmarkedItems[index].title),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    onPressed: () =>
                        confirmRemoveBookmark(bookmarkedItems[index].id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
