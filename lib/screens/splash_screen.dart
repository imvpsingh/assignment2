import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });

    return  const Scaffold(
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome To My Assignment",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.purple),),
          SizedBox(height: 30,),
          SizedBox(
            height: 60,
            child: LoadingIndicator(
              indicatorType: Indicator.lineScale,
              colors: [Colors.pink,Colors.blue,Colors.deepOrange,Colors.pink,Colors.cyanAccent,],
              strokeWidth: 1,
            ),
          ),
        ],
      )),
    );
  }
}
