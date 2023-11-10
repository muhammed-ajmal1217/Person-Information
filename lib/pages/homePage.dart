import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:studentapp/controler/homepage_controller.dart';
import 'package:studentapp/functions/db_functions.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    getAllstudents();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 98, 161),
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 75, 9, 69),
        title: Text(
          'Students Informations',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              Icon(Icons.person, size: 150,color: Color.fromARGB(255, 109, 6, 100),),
              Text('Click on Next',style: TextStyle(color: Color.fromARGB(255, 63, 6, 37),fontSize: 20),)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addbuttonClicked(context);
        },
        backgroundColor: Color.fromARGB(255, 75, 9, 69),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}
