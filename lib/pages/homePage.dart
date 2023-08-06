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
    getAllstudents();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 90, 136),
        title: Text(
          'Persons Informations',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 280),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'lib/images/student.png',
                height: 150,
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
