// ignore_for_file: file_names

import 'package:flutter/material.dart';
class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    var namecontroller=TextEditingController();
    var emailcontroller=TextEditingController();
    var passcontroller=TextEditingController();

    return   Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const  Row(
          mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text('Login',
              style: TextStyle(    
                fontSize: 60,
                fontWeight: FontWeight.bold
              ),
              ),
            ]       
        ),
        const SizedBox(height: 30,),
      const  Row(
          children: [
            SizedBox(width: 60,),  
            Text('Name',
            style: TextStyle(
            fontSize: 20,
            
            ),
            )
            ],
        ),
      const  SizedBox(height: 5,)
        ,
        Form(
          child :Column(
          children:[
            const SizedBox(width: 60,),
            Padding(padding:  const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
              maxLines: 1,
              controller: namecontroller,
              decoration:  InputDecoration(
              hintText: 'Enter your name here',
              suffixIcon:IconButton(onPressed: (){
                namecontroller.clear();
              }, icon: const Icon(Icons.clear)) ,
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),)
        ),
        
        ))
        ]
        )
        ),
        const SizedBox(height: 15,),
      const  Row(
          children: [
            SizedBox(width: 60,),  
            Text('Email',
            style: TextStyle(
            fontSize: 20,
            
            ),
            )
            ],
        ),
      const  SizedBox(height: 5,)
        ,
        Form(
          child :Column(
          children:[
            const SizedBox(width: 60,),
            Padding(padding:  const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
              maxLines: 1,
              controller: emailcontroller,
              decoration:  InputDecoration(
              hintText: 'Enter your email here',
              suffixIcon:IconButton(onPressed: (){
                emailcontroller.clear();
              }, icon: const Icon(Icons.clear)) ,
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),)
        ),
        
        ))
        ]
        )
        ),
        const SizedBox(height: 15,),
        const  Row(
          children: [
            SizedBox(width: 55,),  
            Text('Password',
            style: TextStyle(
            fontSize: 20,
            
            ),
            )
            ],
        ),
      const  SizedBox(height: 5,)
        ,
        Form(
          child :Column(
          children:[
            const SizedBox(width: 60,),
            Padding(padding:  const EdgeInsets.symmetric(horizontal: 42),
              child: TextFormField(
              maxLines: 1,
              controller: passcontroller,
              decoration:  InputDecoration(
              hintText: 'Enter your Password here',
              suffixIcon:IconButton(onPressed: (){
                passcontroller.clear();
              }, icon: const Icon(Icons.clear)) ,
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),)
        ),
        
        ))
        ]
        )
        ),
        const SizedBox(height: 5,),
        const Row (
          children:[
             SizedBox(width: 60,),
             Text('Forget password ?',style: TextStyle(
          color: Color.fromARGB(148, 0, 0, 0)
        ),)])
        ,
        const SizedBox(height: 10,),
          Row(
         children :[ const SizedBox(width: 265,),
         ElevatedButton(onPressed:() {} ,style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo
        ,padding: const EdgeInsets.symmetric(horizontal:23
        ,vertical: 5
        ),
       ), child: const Text('Sign up',style:TextStyle(fontSize:18 , color: Colors.white),))
      ]
        )
      ]
    ),  
    );
  }
}