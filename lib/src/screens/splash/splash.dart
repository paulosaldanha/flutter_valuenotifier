import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  
  const Splash({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: Image.asset('assets/schedule.png'),
            ),
            const SizedBox(
              height: 15,
            ),
            const CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor:
              AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
            ),
          ],
        ));
  }
  
}