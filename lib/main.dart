import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DraggableScrollBarDemo(
    title: 'Duyurular ',
  ));
}

class DraggableScrollBarDemo extends StatelessWidget {
  final String title;

  const DraggableScrollBarDemo({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  ScrollController _customController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
         
        ),
        body:  CustomDemo(controller: _customController),
      ),
    );
  }
}

class CustomDemo extends StatelessWidget {
  final ScrollController controller;

  const CustomDemo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollbar(
      controller: controller,
      child: ListView.builder(
        controller: controller,
        itemCount: 1000,
        itemExtent: 100.0,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.purple.shade200,
              child: Center(
                child: Text(""),
              ),
            ),
          );
        },
      ),
      heightScrollThumb: 48.0,
      backgroundColor: Colors.purple,
      scrollThumbBuilder: (
        Color backgroundColor,
        Animation<double> thumbAnimation,
        Animation<double> labelAnimation,
        double height, {
        Text? labelText,
        BoxConstraints? labelConstraints,
      }) {
        return FadeTransition(
          opacity: thumbAnimation,
          child: Container(
            height: height,
            width: 20.0,
            color: backgroundColor,
          ),
        );
      },
    );
  }
}