  import 'package:flutter/material.dart';
import 'package:studentapp/pages/ListStudent.dart';

SizedBox spacingHeight() {
    return const SizedBox(
                            height: 20,
                          );
  }

  TextField textforFields1({TextEditingController? controller}) {
    return TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(borderSide: BorderSide.none), 
                                fillColor: Color.fromARGB(255, 202, 152, 204),
                            filled: true,
                                ),
                          );
  }
  editGoback(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => ListStudent()));
  }