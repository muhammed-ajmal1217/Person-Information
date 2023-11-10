import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/controler/list_editing_controller.dart';
import 'package:studentapp/provider/list_editing_provider.dart';

// ignore: must_be_immutable
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

class _edit_studentState extends State<edit_student> {
  @override
  void initState() {
    final editPro=Provider.of<listEditingProvider>(context,listen: false);
    super.initState();
    editPro.nameController = TextEditingController(text: widget.name);
    editPro.ageController = TextEditingController(text: widget.age);
    editPro.classController = TextEditingController(text: widget.Class);
    editPro.dobController = TextEditingController(text: widget.dob);
    editPro.addressController = TextEditingController(text: widget.address);
    editPro.file = widget.imagePath !='' ? File(widget.imagePath) : null;
    }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 159, 98, 161),
      body: Builder(
        builder: (context) {
          final mediaQuery = MediaQuery.of(context);
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.width * 0,  
                vertical: mediaQuery.size.height * 0,  
              ),
            child: ListView(
              children: [
                SingleChildScrollView(
                  child: Consumer<listEditingProvider>(
                    builder: (context, editPro, child) => 
                     Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(children: [
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
                              backgroundColor: Color.fromARGB(255, 94, 6, 72),
                              child: editPro.file == null
                                  ? Icon(
                                      Icons.camera_alt_outlined,
                                      size: 50,
                                    )
                                  : ClipOval(
                                      child: Image.file(
                                        editPro.file!,
                                        fit: BoxFit.cover,
                                        width: 133,
                                        height: 133,
                                      ),
                                    ),
                            ),
                          ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {
                                      editPro.getCam(ImageSource.gallery);
                                    },
                                    color: Color.fromARGB(255, 75, 2, 69),
                                    child: Text(
                                      'Take from Gallary',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16,),
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {
                                     editPro.getCam(ImageSource.camera);
                                    },
                                    color: Color.fromARGB(255, 75, 2, 69),
                                    child: const Text(
                                      
                                      'Take from Camera',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            textforFields1(controller: editPro.nameController,),
                            spacingHeight(),
                            textforFields1(controller: editPro.ageController,),
                            spacingHeight(),
                            textforFields1(controller: editPro.classController,),
                            spacingHeight(),
                            textforFields1(controller: editPro.dobController,),
                            spacingHeight(),
                            textforFields1(controller: editPro.addressController,),
                            spacingHeight(),
                            GestureDetector(
                            onTap: () => editPro.updateall(context,index: widget.index),
                            child: Container(
                              width: 140,
                              height: 30,
                              child: Center(child: Text('Save',style: TextStyle(color: Colors.white),)),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 99, 5, 86),
                                borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                            onTap: () => editGoback(context),
                            child: Container(
                              width: 160,
                              height: 30,
                              child: Center(child: Text('Goback to list',style: TextStyle(color: Colors.white),)),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 99, 5, 86),
                                borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    ));
  }


}
