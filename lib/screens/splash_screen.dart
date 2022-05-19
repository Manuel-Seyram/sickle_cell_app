import 'package:flutter/material.dart';
import 'package:sickle_cell_app/widgets/navbar.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen>{
  int splashtime = 7; 
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
        Navigator.pushReplacement(context, MaterialPageRoute(
          //pushReplacement = replacing the route so that
          //navigation to Home page.
          builder: (context){
              return const Navbar();       
        }));
    }); 

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body:Container(      
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/sickle_cell.png'),
            fit: BoxFit.cover,
          ),
        ),
            )  
      );
  }
}