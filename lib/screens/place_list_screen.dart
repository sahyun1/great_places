import 'package:flutter/material.dart';

class PlaceListScreen extends StatelessWidget {
  // const PlaceListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your space'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Center(child: Text('list')),
    );
  }
}
