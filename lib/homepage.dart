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
final String id;
final String eventName;
final String eventDescription;


Event({
required this.id,
required this.eventName,
required this.eventDescription,
});


Map<String, dynamic> toJson() {
return {
'eventName': eventName,
'eventDescription': eventDescription,
};
}
}


class HomePage extends StatefulWidget {
@override
_HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final TextEditingController eventNameController = TextEditingController();
final TextEditingController eventDescriptionController =
TextEditingController();


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Event Posting'),
backgroundColor: Color.fromRGBO(172, 137, 124, 1.0),
elevation: 0,
),
body: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
Padding(
padding: EdgeInsets.all(16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
Text(
'Post an Event',
style: TextStyle(
color: Colors.white,
fontSize: 24.0,
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 16.0),
TextField(
controller: eventNameController,
decoration: InputDecoration(
labelText: 'Event Name',
fillColor: Colors.white,
filled: true,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
),
),
),
SizedBox(height: 16.0),
TextField(
controller: eventDescriptionController,
maxLines: 3,
decoration: InputDecoration(
labelText: 'Event Description',
fillColor: Colors.white,
filled: true,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10.0),
),
),
),
SizedBox(height: 16.0),
ElevatedButton(
onPressed: () => _postEvent(),
child: Text('Post Event'),
style: ElevatedButton.styleFrom(
backgroundColor: Colors.blue,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10.0),
),
),
),
SizedBox(height: 16.0),
],
),
),
Expanded(
child: StreamBuilder<QuerySnapshot>(
stream: _firestore.collection('events').snapshots(),
builder: (context, snapshot) {
if (!snapshot.hasData) {
return Center(
child: CircularProgressIndicator(),
);
}
final events = snapshot.data!.docs.map((doc) {
final data = doc.data() as Map<String, dynamic>;
return Event(
id: doc.id,
eventName: data['eventName'],
eventDescription: data['eventDescription'],
);
}).toList();
return ListView.builder(
itemCount: events.length,
itemBuilder: (context, index) {
return ListTile(
title: Text(events[index].eventName),
subtitle: Text(events[index].eventDescription),
trailing: Row(
mainAxisSize: MainAxisSize.min,
children: [
IconButton(
onPressed: () => _updateEvent(events[index]),
icon: Icon(Icons.edit),
),
IconButton(
onPressed: () => _deleteEvent(events[index]),
icon: Icon(Icons.delete),
),
],
),
);
},
);
},
),
),
],
),
);
}


void _postEvent() {
final eventName = eventNameController.text.trim();
final eventDescription = eventDescriptionController.text.trim();
if (eventName.isNotEmpty && eventDescription.isNotEmpty) {
_firestore.collection('events').add({
'eventName': eventName,
'eventDescription': eventDescription,
});
eventNameController.clear();
eventDescriptionController.clear();
}
}


void _updateEvent(Event event) {
// Implement update functionality
}


void _deleteEvent(Event event) {
_firestore.collection('events').doc(event.id).delete();
}
}
