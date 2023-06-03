import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zhiyin_flutter/routes/Routes.dart';

class RapPage extends StatefulWidget {
  const RapPage({super.key});

  @override
  State<RapPage> createState() => _RapPageState();
}

class _RapPageState extends State<RapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rap'),
        backgroundColor: Colors.white,
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
            child: const Text('才艺展示'),
          ),
        ),
      ),
    );
  }

  void _showTalent() {
    DYRoute().pushNamed(context, DYRoute.basketball);
  }
}
