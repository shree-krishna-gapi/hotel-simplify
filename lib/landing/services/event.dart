

class Event{
  String eventName;
  Event({this.eventName});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        eventName: json['Title'] as String
    );
  }
}