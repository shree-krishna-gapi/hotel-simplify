import 'package:flutter/material.dart';
import 'event.dart';
class StateContainer extends StatefulWidget {
  final Widget child;
  final Event event;
  StateContainer({@required this.child,this.event});
  static StateContainerState of(BuildContext context){
    return(context.inheritFromWidgetOfExactType(InheritedContainer) as InheritedContainer).data;
  }
  StateContainerState createState() => StateContainerState();
}
class StateContainerState extends State<StateContainer> {
  Event event;
  void updateEventInfo({eventName}){
    event=new Event(eventName:eventName);
    setState(() {
      event=event;
    });
  }
  @override
  Widget build(BuildContext context) {
    return InheritedContainer(data:this, child: widget.child,);
  }
}
class InheritedContainer extends InheritedWidget {
  final StateContainerState data;
  InheritedContainer({Key key,@required this.data, @required Widget child}) : super(key: key, child: child);
  @override
  bool updateShouldNotify( InheritedContainer oldWidget) {
    return true;
  }
}
