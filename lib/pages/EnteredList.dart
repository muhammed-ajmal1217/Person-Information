import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'ListStudent.dart';
import 'functions/db_functions.dart';
import 'model/StudentModel.dart';

class ListEnter extends StatefulWidget {
  ListEnter({super.key});

  @override
  State<ListEnter> createState() => _ListEnterState();
}

class _ListEnterState extends State<ListEnter> {
  final _nameController = TextEditingController();

  final _ageController = TextEditingController();

  final _classController = TextEditingController();

  final _dobController = TextEditingController();

  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  File? file;

  ImagePicker image = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Color.fromARGB(255, 56, 57, 58),
                      child: file == null
                          ? Icon(
                              Icons.camera_alt_outlined,
                              size: 50,
                            )
                          : ClipOval(
                              child: Image.file(
                                file!,
                                fit: BoxFit.cover,
                                width: 133,
                                height: 133,
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              getGallary();
                            },
                            color: Colors.blue[900],
                            child: Text(
                              'Take from Gallary',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          MaterialButton(
                            onPressed: () {
                              getCam();
                            },
                            color: Colors.blue[900],
                            child: Text(
                              'Take from Camera',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is Empty';
                        } else {
                          return null;
                        }
                      },
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Age is Empty';
                        } else {
                          return null;
                        }
                      },
                      controller: _ageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Age',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Class is Empty';
                        } else {
                          return null;
                        }
                      },
                      controller: _classController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Class',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Division is Empty';
                        } else {
                          return null;
                        }
                      },
                      controller: _dobController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Division',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Address is Empty';
                        } else {
                          return null;
                        }
                      },
                      controller: _addressController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Address',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            addbuttonClickedOn(context);
                          } else {
                            print('Data is Empty');
                          }
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add Student')),
                    ElevatedButton.icon(
                        onPressed: () {
                          gobacktoList();
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Go back to List')),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future<void> addbuttonClickedOn(
    BuildContext context,
  ) async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final classs = _classController.text.trim();
    final dob = _dobController.text.trim();
    final address = _addressController.text.trim();

    if (name.isEmpty ||
        age.isEmpty ||
        classs.isEmpty ||
        dob.isEmpty ||
        address.isEmpty) {
      return;
    }
    final student = StudentModel(
      name: name,
      age: age,
      className: classs,
      dob: dob,
      address: address,
      imagePath: file?.path ?? '',
    );

    addStudent(student);
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return ListStudent();
    }));
  }

  getCam() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getGallary() async {
    var img = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }

  gobacktoList() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => ListStudent()));
  }
}
