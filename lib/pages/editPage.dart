import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/pages/ListStudent.dart';
import 'package:studentapp/pages/functions/db_functions.dart';
import 'package:studentapp/pages/model/StudentModel.dart';

class edit_student extends StatefulWidget {
  var name;
  var age;
  var Class;
  var dob;
  var address;

  dynamic imagePath;
  int index;

  edit_student({
    required this.name,
    required this.age,
    required this.Class,
    required this.dob,
    required this.address,
    required this.imagePath,
    required this.index,
  });

  @override
  State<edit_student> createState() => _edit_studentState();
}

File? file;

ImagePicker image = ImagePicker();

class _edit_studentState extends State<edit_student> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _classController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _addressController = TextEditingController();






  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _ageController = TextEditingController(text: widget.age);
    _classController = TextEditingController(text: widget.Class);
    _dobController = TextEditingController(text: widget.dob);
    _addressController = TextEditingController(text: widget.address);

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: ListView(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 50),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(children: [
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
                      Row(
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
                            width: 35,
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
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          // hintText: 'Name',
                          labelText: 'Name'
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _ageController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          // hintText: 'Age',
                          labelText: 'Age',
                          filled: true,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _classController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail'
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _dobController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                          filled: true,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _addressController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Address',
                          filled: true,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          updateall();
                        },
                        label: Text('Save'),
                        icon: Icon(Icons.check),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          editGoback();
                        },
                        icon: Icon(Icons.arrow_back),
                        label: Text('Go back to List'),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> updateall() async {
    final ed = _nameController.text.trim();
    final ed1 = _ageController.text.trim();
    final ed2 = _classController.text.trim();
    final ed3 = _dobController.text.trim();
    final ed4 = _addressController.text.trim();
    final ed5 = file?.path ?? '';

    if (ed.isEmpty ||
        ed1.isEmpty ||
        ed2.isEmpty ||
        ed3.isEmpty ||
        ed4.isEmpty ||
        ed5.isEmpty) {
      return;
    } else {
      final updation = StudentModel(
          name: ed,
          age: ed1,
          className: ed2,
          dob: ed3,
          address: ed4,
          imagePath: ed5);

      gotoEditPage(widget.index, updation);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ListStudent()));

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 77, 93, 164),
          content: Text("Saved changes")));
    }
  }
//   getimage() async {
//     final ? _wantimage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (_wantimage != null) {
//       setState(() {
//         _file = File(_wantimage.path);
//         carphoto = _wantimage.path;
//       });
//     }
//   }

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

  editGoback() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => ListStudent()));
  }
}
