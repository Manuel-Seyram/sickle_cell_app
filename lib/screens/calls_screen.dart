import 'package:flutter/material.dart';
import 'package:sickle_cell_app/widgets/calls_list.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            "Hospital Hotlines",
            style: TextStyle(color: Colors.black, fontSize: 22.0),
          )),
          body: const Callslist(),
    );
  }
}
