// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sickle_cell_app/extras/map_utils.dart';
import 'package:sickle_cell_app/widgets/current_location.dart';
import 'package:url_launcher/url_launcher.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Location> createState() => _LocationState(phoneNumber: '193');
}

class _LocationState extends State<Location> {
  var size,height,width;
 


  late final String phoneNumber;
  _LocationState({required this.phoneNumber});
  @override
  Widget build(BuildContext context) {

         size = MediaQuery.of(context).size;
         height = size.height;
         width = size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            "Location",
            style: TextStyle(color: Colors.black, fontSize: 22.0),
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 180,
                          width: 180,
                          child: GestureDetector(
                            onTap: () => _callNumber(phoneNumber),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 0,
                                child: Column(children: [
                                  Lottie.asset('assets/ambulance.json',
                                      height: 150, width: 150),
                                  const Text(
                                    'Call ambulance',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ])),
                          ))
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                          height: 180,
                          width: 180,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return const CurrentLocation();
                              }));
                            },
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 0,
                                child: Column(children: [
                                  Lottie.asset('assets/location.json',
                                      height: 150, width: 150),
                                  const Text(
                                    'Current Location',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ])),
                          ))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                         height: 180,
                          width: 180,
                          child: GestureDetector(
                            onTap: () async {
                              MapUtils.openMap();
                            },
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 0,
                                child: Column(children: [
                                  Lottie.asset('assets/hospital.json',
                                      height: 150, width: 150),
                                  const Text(
                                    'Nearby Hospitals',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ])),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  //call ambulance

  void _callNumber(String phoneNumber) async {
    String url = "tel:" + phoneNumber;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not call $phoneNumber';
    }
  }
  
}
