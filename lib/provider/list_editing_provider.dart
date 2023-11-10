import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/model/StudentModel.dart';
import 'package:studentapp/pages/ListStudent.dart';
import 'package:studentapp/functions/db_functions.dart';

class listEditingProvider extends ChangeNotifier{
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
    File? file;
    ImagePicker image = ImagePicker();
     updateall(BuildContext context,{required int index})  {
    final ed = nameController.text.trim();
    final ed1 = ageController.text.trim();
    final ed2 = classController.text.trim();
    final ed3 = dobController.text.trim();
    final ed4 = addressController.text.trim();
    final ed5 = file?.path ?? '';

    if (ed.isEmpty ||
        ed1.isEmpty ||
        ed2.isEmpty ||
        ed3.isEmpty ||
        ed4.isEmpty 
        ) {
      return;
    } else {
      final updation = StudentModel(
          name: ed,
          age: ed1,
          className: ed2,
          dob: ed3,
          address: ed4,
          imagePath: ed5);

      gotoEditPage(index, updation);
      
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ListStudent()));

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromARGB(255, 77, 93, 164),
          content: Text("Saved changes")));
          
    }
    notifyListeners();
  }

   getCam(ImageSource source) async {
    var img = await image.pickImage(source: source);
      file = File(img!.path);
      notifyListeners();
    }
}