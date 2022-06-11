import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Callslist extends StatelessWidget {
  Callslist({Key? key}) : super(key: key);
  String callKorlebu = '030 273 9510';
  String callRidge = '024 781 4770';
  String callMilitaryhospital = '030 277 7595';
  String callTemageneral = '030 330 2695';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 30.0,
        ),
        ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            10.0,
          )),
          contentPadding: const EdgeInsets.all(10.0),
          title: const Text('37 Military Hospital',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          onTap: () => _callMilitaryhospital(),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding: const EdgeInsets.all(10.0),
          title: const Text('Korle-Bu Hospital',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          onTap: () => _callKorlebu(),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding: const EdgeInsets.all(10.0),
          title: const Text('Ridge Hospital',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          onTap: () => _callRidge(),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding: const EdgeInsets.all(10.0),
          title: const Text('Tema General Hospital',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          onTap: () => _callTemageneral(),
        ),
      ],
    );
  }
  //call korle-bu hospital
void _callKorlebu() async {
    String url = "tel:" + callKorlebu;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not call $callKorlebu';
    }
  }
  //call military hospital
  void _callMilitaryhospital() async {
    String url = "tel:" + callMilitaryhospital;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not call $callMilitaryhospital';
    }
  }
  // call ridge hospital
    void _callRidge() async {
    String url = "tel:" + callRidge;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not call $callRidge';
    }
  }
  //call tema general hospital
     void _callTemageneral() async {
    String url = "tel:" + callTemageneral;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not call $callTemageneral';
    }
  }
 

}
