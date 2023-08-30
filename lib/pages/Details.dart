import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/pages/ListStudent.dart';

import 'model/StudentModel.dart';

class Details extends StatefulWidget {
  StudentModel student;

  Details({Key? key, required this.student}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  File? file;

  ImagePicker image = ImagePicker();
  @override
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(255, 250, 252, 252),
                    width: 3,
                  ),
                ),
                child: CircleAvatar(
                  radius: screenWidth * 0.3,
                  backgroundColor: Colors.blue[300],
                  backgroundImage: FileImage(File(widget.student.imagePath)),
                  child: file == null
                      ? Container()
                      : ClipOval(
                          child: Image.file(
                            file!,
                            fit: BoxFit.cover,
                            width: screenWidth * 0.4,
                            height: screenWidth * 0.4,
                          ),
                        ),
                ),
              ),
              Text(
                ' ${widget.student.name}',
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                ' ${widget.student.age}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                ' ${widget.student.className}',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                ' ${widget.student.dob}',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                ' ${widget.student.address}',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gobackToNamePage(context);
        },
        backgroundColor: const Color.fromARGB(255, 34, 90, 136),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }

  void gobackToNamePage(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => ListStudent()));
  }
}
