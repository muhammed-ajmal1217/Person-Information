import 'package:flutter/material.dart';
import 'package:studentapp/pages/ListStudent.dart';

FloatingActionButton floatingActionButton1(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      gobackToNamePage(context);
    },
    backgroundColor: Color.fromARGB(255, 75, 9, 69),
    child: const Icon(
      Icons.arrow_back,
      color: Colors.white,
    ),
  );
}

void gobackToNamePage(BuildContext context) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (ctx) => ListStudent()));
}

SizedBox spacingHeight() {
  return const SizedBox(
    height: 10,
  );
}

Text details(String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: 25, color: Colors.white),
  );
}
