import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  // Controllers for text fields
  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _eventTypeController = TextEditingController();
  TextEditingController _eventDateController = TextEditingController();
  TextEditingController _eventLocationController = TextEditingController();
  TextEditingController _eventDescriptionController = TextEditingController();
  TextEditingController _eventOrganizerController = TextEditingController();
  TextEditingController _eventTicketInfoController = TextEditingController();
  TextEditingController _eventContactInfoController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _eventNameController.dispose();
    _eventTypeController.dispose();
    _eventDateController.dispose();
    _eventLocationController.dispose();
    _eventDescriptionController.dispose();
    _eventOrganizerController.dispose();
    _eventTicketInfoController.dispose();
    _eventContactInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _eventNameController,
              decoration: InputDecoration(labelText: 'Event Name'),
            ),
            TextFormField(
              controller: _eventTypeController,
              decoration: InputDecoration(labelText: 'Event Type'),
            ),
            TextFormField(
              controller: _eventDateController,
              decoration: InputDecoration(labelText: 'Event Date and Time'),
              keyboardType: TextInputType.datetime,
            ),
            TextFormField(
              controller: _eventLocationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextFormField(
              controller: _eventDescriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
            TextFormField(
              controller: _eventOrganizerController,
              decoration: InputDecoration(labelText: 'Organizer'),
            ),
            TextFormField(
              controller: _eventTicketInfoController,
              decoration: InputDecoration(labelText: 'Ticket Information'),
            ),
            TextFormField(
              controller: _eventContactInfoController,
              decoration: InputDecoration(labelText: 'Contact Information'),
            ),
            ElevatedButton(
              onPressed: () {
                // Access data using controllers
                String eventName = _eventNameController.text;
                String eventType = _eventTypeController.text;
                String eventDate = _eventDateController.text;
                String eventLocation = _eventLocationController.text;
                String eventDescription = _eventDescriptionController.text;
                String eventOrganizer = _eventOrganizerController.text;
                String eventTicketInfo = _eventTicketInfoController.text;
                String eventContactInfo = _eventContactInfoController.text;

                // Process or save the event details as needed
              },
              child: Text('Create Event'),
            ),
          ],
        ),
      ),
    );
  }
}
