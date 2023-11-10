import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/controler/details.controller.dart';
import 'package:studentapp/model/StudentModel.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  StudentModel student;

  Details({Key? key, required this.student}) : super(key: key);

  File? file;

  ImagePicker image = ImagePicker();

  @override
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 98, 161),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              height: 550,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 95, 12, 72),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromARGB(255, 88, 6, 51),
                        width: 3,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: screenWidth * 0.3,
                      backgroundColor: Color.fromARGB(255, 92, 6, 63),
                      backgroundImage: FileImage(File(student.imagePath)),
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
                ),
                details('${student.name}'),
                spacingHeight(),
                details('${student.age}'),
                spacingHeight(),
                details('${student.className}'),
                spacingHeight(),
                details('${student.dob}'),
                spacingHeight(),
                details('${student.address}'),
               
              ]),
            ),
          ),
        ),
      ),
      floatingActionButton: floatingActionButton1(context),
    );
  }
}
