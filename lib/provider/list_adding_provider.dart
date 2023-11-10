  import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/model/StudentModel.dart';
import 'package:studentapp/pages/ListStudent.dart';
import 'package:studentapp/functions/db_functions.dart';

class listAddingProvider extends ChangeNotifier{
  final nameController = TextEditingController();

  final ageController = TextEditingController();

  final classController = TextEditingController();

  final dobController = TextEditingController();

  final addressController = TextEditingController();

  File? file;
  
  ImagePicker image = ImagePicker();
    
  Future<void> addbuttonClickedOn(
    BuildContext context,
  ) async {
    final name = nameController.text.trim();
    final age = ageController.text.trim();
    final classs = classController.text.trim();
    final dob = dobController.text.trim();
    final address = addressController.text.trim();

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
    nameController.clear();
    ageController.clear();
    classController.clear();
    dobController.clear();
    addressController.clear();

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return ListStudent();
    }));
    notifyListeners();
  }
 
    
    getCam(ImageSource source) async {
    var img = await image.pickImage(source: source);
      file = File(img!.path);
      notifyListeners();
    }
}