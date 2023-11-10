import 'package:hive/hive.dart';

part 'StudentModel.g.dart';
@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? index;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String className;
  @HiveField(4)
  final String dob;
  @HiveField(5)
  final String address;
  @HiveField(6)
  final String imagePath;

  StudentModel(
      {required this.name,
      required this.age,
      required this.className,
      required this.dob,
      required this.address,
      required this.imagePath,
      this.index});
}
