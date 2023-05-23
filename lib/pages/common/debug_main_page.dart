import 'package:flutter/material.dart';
import 'package:zhiyin_flutter/routes/Routes.dart';

class DebugMainPage extends StatefulWidget {
  const DebugMainPage({Key? key}) : super(key: key);

  @override
  State<DebugMainPage> createState() => _DebugMainPageState();
}

class _DebugMainPageState extends State<DebugMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('哎哟你干嘛'),
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: OutlinedButton(
            onPressed: _showTalent,
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text('Music～'),
          ),
        ),
      ),
    );
  }

  void _showTalent() {
    Navigator.pushNamed(context, DYRoute.sing);
  }
}
