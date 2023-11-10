import 'dart:io';
import 'package:flutter/material.dart';
import 'package:studentapp/controler/list_student_controller.dart';
import 'package:studentapp/model/StudentModel.dart';
import 'package:studentapp/pages/list_edit_page.dart';
import 'package:studentapp/functions/db_functions.dart';

class ListStudent extends StatelessWidget {
  ListStudent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 75, 9, 69),
        title: Text(
          'List of Students',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 159, 98, 161),
      body: SafeArea(
        child: Builder(builder: (context) {
          final mediaQuery = MediaQuery.of(context);
          return ValueListenableBuilder(
            valueListenable: studentListNotifier,
            builder: (BuildContext ctx, List<StudentModel> studentList,
                Widget? child) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0,
                  vertical: mediaQuery.size.height * 0,
                ),
                child: ListView.separated(
                  itemBuilder: (ctx, index) {
                    final data = studentList[index];
                    return GestureDetector(
                      child: Card(
                        color: Color.fromARGB(255, 129, 32, 113),
                        elevation: 15,
                        child: ListTile(
                          leading: Container(
                            child: GestureDetector(
                              onTap: () {
                                navigateToDetails(context, data);
                              },
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color.fromARGB(255, 182, 10, 159),
                                    width: 3,
                                  ),
                                ),
                                child: CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 28, 29, 29),
                                  radius: 30,
                                  backgroundImage:
                                      FileImage(File(data.imagePath)),
                                ),
                              ),
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  deletStudent(index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => edit_student(
                                        index: index,
                                        name: data.name,
                                        age: data.age,
                                        Class: data.className,
                                        address: data.address,
                                        dob: data.dob,
                                        imagePath: data.imagePath),
                                  ));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          title: Text(data.name,style: TextStyle(color: Colors.white),),
                          subtitle: Text(
                            'Click on the picture',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider(
                      color: Color.fromARGB(255, 119, 3, 119)
                    );
                  },
                  itemCount: studentList.length,
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingButton(),
    );
  }


}


