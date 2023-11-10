import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studentapp/model/StudentModel.dart';
ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  await studentDb.add(value);
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllstudents() async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDb.values);
  studentListNotifier.notifyListeners();
}

Future<void> deletStudent(index) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  await studentDb.deleteAt(index);
  getAllstudents();
}

Future<void> gotoEditPage(index, StudentModel value) async {
  final studentDb = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDb.values);
  studentListNotifier.notifyListeners();
  studentDb.putAt(index, value);
  getAllstudents();
}
