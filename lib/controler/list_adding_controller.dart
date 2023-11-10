  import 'package:flutter/material.dart';
import 'package:studentapp/pages/ListStudent.dart';

SizedBox spacingHeight() {
    return const SizedBox(
                          height: 20,
                        );
  }

  TextFormField textFormfields({String? value1  ,  String? name,TextEditingController? controller}) {
    return TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return value1;
                            } else {
                              return null;
                            }
                          },
                          controller:controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: name!,
                            fillColor: Color.fromARGB(255, 202, 152, 204),
                            filled: true,
                          ),
                        );
  }

  gobacktoList(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => ListStudent()));
  }