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
      body: SafeArea(child: SingleChildScrollView(
        child: Builder(builder: (context) {
          final mediaQuery = MediaQuery.of(context);
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  mediaQuery.size.width * 0, 
              vertical: mediaQuery.size.height * 0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor: Color.fromARGB(255, 95, 166, 236),
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
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  getCam(ImageSource.gallery);
                                },
                                color: Colors.blue[900],
                                child: Text(
                                  'Take from Gallary',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  getCam(ImageSource.camera);
                                },
                                color: Colors.blue[900],
                                child: Text(
                                  'Take from Camera',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
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
                            filled: true,
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
                            filled: true,
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
                            filled: true,
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
                            filled: true,
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
                            filled: true,
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
          );
        }),
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
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return ListStudent();
    }));
  }

  getCam(ImageSource source) async {
    var img = await image.pickImage(source: source);
    setState(() {
      file = File(img!.path);
    });
  }

  gobacktoList() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => ListStudent()));
  }
}
