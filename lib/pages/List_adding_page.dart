
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/controler/list_adding_controller.dart';
import 'package:studentapp/provider/list_adding_provider.dart';


class ListEnter extends StatelessWidget {
  ListEnter({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 98, 161),
      body: SafeArea(child: SingleChildScrollView(
        child: Builder(builder: (context) {
          final mediaQuery = MediaQuery.of(context);
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mediaQuery.size.width * 0,
              vertical: mediaQuery.size.height * 0,
            ),
            child: Consumer<listAddingProvider>(
              builder: (context, listAddingProvider, child) => Column(
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
                                color: Color.fromARGB(255, 133, 10, 122),
                                width: 3,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: Color.fromARGB(255, 110, 14, 90),
                              child: listAddingProvider.file == null
                                  ? Icon(
                                      Icons.camera_alt_outlined,
                                      size: 50,
                                    )
                                  : ClipOval(
                                      child: Image.file(
                                        listAddingProvider.file!,
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
                                    listAddingProvider
                                        .getCam(ImageSource.gallery);
                                  },
                                  color: Color.fromARGB(255, 121, 17, 121),
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
                                    listAddingProvider
                                        .getCam(ImageSource.camera);
                                  },
                                  color: Color.fromARGB(255, 121, 17, 121),
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
                          textFormfields(value1: 'Name is Empty',name: 'Name',controller: listAddingProvider.nameController),
                          spacingHeight(),
                          textFormfields(value1: 'Age is Empty',name: 'Age',controller: listAddingProvider.ageController),
                          spacingHeight(),
                          textFormfields(value1: 'Class is Empty',name: 'Class',controller: listAddingProvider.classController),
                          spacingHeight(),
                          textFormfields(value1: 'Divisison is Empty',name: 'Division',controller: listAddingProvider.dobController),
                          spacingHeight(),
                          textFormfields(value1: 'Address is Empty',name: 'Address',controller: listAddingProvider.addressController),
                          spacingHeight(),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                listAddingProvider.addbuttonClickedOn(context);
                              } else {
                                print('Data is Empty');
                              }
                            },
                            child: Container(
                              width: 140,
                              height: 30,
                              child: Center(
                                  child: Text(
                                'Add Student',
                                style: TextStyle(color: Colors.white),
                              )),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 99, 5, 86),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () => gobacktoList(context),
                            child: Container(
                              width: 160,
                              height: 30,
                              child: Center(
                                  child: Text(
                                'Goback to list',
                                style: TextStyle(color: Colors.white),
                              )),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 99, 5, 86),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      )),
    );
  }
}
