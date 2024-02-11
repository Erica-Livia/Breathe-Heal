void main() {
  runApp(Homepage());
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Posting',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class Event {
  final String eventName;
  final String eventDescription;

  Event({
    required this.eventName,
    required this.eventDescription,
  });
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Event> events = [];
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventDescriptionController = TextEditingController();

  void postEvent() {
    if (eventNameController.text.isNotEmpty && eventDescriptionController.text.isNotEmpty) {
      final newEvent = Event(
        eventName: eventNameController.text,
        eventDescription: eventDescriptionController.text,
      );

      setState(() {
        events.add(newEvent);
        eventNameController.clear();
        eventDescriptionController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Posting'),
        backgroundColor: Color.fromRGBO(172, 137, 124, 1.0),
        elevation: 0,
      ),
      body: Container(
        color: Color.fromRGBO(172, 137, 124, 1.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: eventNameController,
                decoration: InputDecoration(
                  hintText: 'Event Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                controller: eventDescriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Event Description',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: postEvent,
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Post Event',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(172, 137, 124, 1.0),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Posted Events',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return Card(
                    elevation: 4.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(
                        event.eventName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(event.eventDescription),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}