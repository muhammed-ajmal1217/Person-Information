import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:studentapp/pages/ListStudent.dart';
import 'package:studentapp/pages/functions/db_functions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    getAllstudents();
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        backgroundColor:Colors.red[300],
        title: Text(
          'Students Informations',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.25),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'lib/images/student.png',
                height: screenHeight * 0.3,
              )
            ],
          ),
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addbuttonClicked(context);
        },
        backgroundColor: const Color.fromARGB(255, 34, 90, 136),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> addbuttonClicked(BuildContext context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => ListStudent()));
  }
}
