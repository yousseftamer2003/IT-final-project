// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:project_oc_committe/LogInScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
 return  Scaffold(
  body: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Text('Hello',
      style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 50
),
),
const SizedBox(height: 5 ),
const Text('welcome to Hacker Rank FCDS, where you find the best committees',
textAlign: TextAlign.center,
style: TextStyle(
color: Colors.black),
        ),
const SizedBox(height: 20),
ElevatedButton(onPressed: () {           
            Navigator.push(
              context,
              MaterialPageRoute(builder:  (context) =>const LogInScreen()),
            );
          },
 style: ElevatedButton.styleFrom( 
  backgroundColor: Colors.indigo,
 padding: const EdgeInsets.symmetric(
horizontal: 10,vertical: 10
)
)  ,
 child: const Text('LogIn',
style: TextStyle(
color: Colors.white,
fontSize: 20
          ),       
         ),
        ),
const SizedBox(height: 10),
ElevatedButton(onPressed: (){},
style: ElevatedButton.styleFrom( 
backgroundColor:const  Color.fromARGB(255, 200, 200, 204),
padding: const EdgeInsets.symmetric(
horizontal: 94,vertical: 10
)
)  ,
 child: const Text('SignUp',
style: TextStyle(
color: Color.fromARGB(255, 0, 0, 0),
fontSize: 20
          ),       
         ),
        )  
      ],
     ),
    ),
   );
  }
}