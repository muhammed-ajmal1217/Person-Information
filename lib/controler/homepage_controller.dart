  import 'package:flutter/material.dart';
import 'package:studentapp/pages/ListStudent.dart';

Future<void> addbuttonClicked(BuildContext context) async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => ListStudent()));
  }