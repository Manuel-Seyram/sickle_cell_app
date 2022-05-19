import 'package:flutter/material.dart';

class Callslist extends StatelessWidget {
  const Callslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 30.0,
        ),
        ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0,)),
              contentPadding: const EdgeInsets.all(10.0),
              title: const Text('37 Military Hospital', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
         const SizedBox(
          height: 20.0,
        ),
       ListTile(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              contentPadding: const EdgeInsets.all(10.0),
              title: const Text('Korle-Bu Hospital', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
           const SizedBox(
          height: 20.0,
        ),
       ListTile(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              contentPadding: const EdgeInsets.all(10.0),
              title: const Text('Ridge Hospital', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
            const SizedBox(
          height: 20.0,
        ),
        ListTile(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              contentPadding: const EdgeInsets.all(10.0),
              title: const Text('Tema General Hospital', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
      ],
    );
  }
}
