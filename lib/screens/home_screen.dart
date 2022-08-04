import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final  _screenWidth = MediaQuery.of(context).size.width;
    final  _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('DMS'),
      ),
      body: _homeContent(),
    );
  }

  _homeContent() {
    return const Padding(
        padding: EdgeInsets.all(16.0),
      child: Card(
        child: Placeholder(),
      ),
    );
  }
}
