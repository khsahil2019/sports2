import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationMessage> notificationMessages = [
    NotificationMessage(
      id: 1,
      sender: 'Coach',
      message: 'Practice will start at 4 PM today.',
      time: DateTime.now(),
    ),
    NotificationMessage(
      id: 2,
      sender: 'Coach',
      message: 'Practice will start at 4 PM today.',
      time: DateTime.now(),
    ),
    NotificationMessage(
      id: 3,
      sender: 'Coach',
      message: 'Practice will start at 4 PM today.',
      time: DateTime.now(),
    ),
    // Add more NotificationMessage instances as needed
  ];

  int unreadNotificationsCount = 0;
  NotificationMessage? selectedNotification;

  @override
  void initState() {
    super.initState();
    unreadNotificationsCount = notificationMessages.length;
  }

  void viewNotification(NotificationMessage message) {
    setState(() {
      selectedNotification = message;
      if (!message.viewed) {
        message.viewed = true;
        unreadNotificationsCount--;
      }
    });
  }

  Color? getBackgroundColor(NotificationMessage message) {
    return message.viewed ? Colors.white : Colors.blue[50];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedNotification != null) {
          setState(() {
            selectedNotification = null;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title:
              Text(selectedNotification == null ? 'Notifications' : 'Message'),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    setState(() {
                      selectedNotification = null;
                    });
                  },
                ),
                if (unreadNotificationsCount > 0)
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Text(
                        unreadNotificationsCount.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
        body: selectedNotification == null
            ? ListView.builder(
                itemCount: notificationMessages.length,
                itemBuilder: (context, index) {
                  final message = notificationMessages[index];
                  return GestureDetector(
                    onTap: () {
                      viewNotification(message);
                    },
                    child: Container(
                      color: getBackgroundColor(message),
                      child: ListTile(
                        title: Text(message.sender),
                        subtitle: Text(message.message),
                        trailing: Text(
                          '${message.time.hour}:${message.time.minute}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From: ${selectedNotification!.sender}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      selectedNotification!.message,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Time: ${selectedNotification!.time.hour}:${selectedNotification!.time.minute}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class NotificationMessage {
  final int id;
  final String sender;
  final String message;
  final DateTime time;
  bool viewed;

  NotificationMessage({
    required this.id,
    required this.sender,
    required this.message,
    required this.time,
    this.viewed = false,
  });
}
