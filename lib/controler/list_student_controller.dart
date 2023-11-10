  import 'package:flutter/material.dart';
import 'package:studentapp/model/StudentModel.dart';
import 'package:studentapp/pages/Details.dart';
import 'package:studentapp/pages/List_adding_page.dart';
class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        gobackTodetails(context);
      },
      backgroundColor: Color.fromARGB(255, 75, 9, 69),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

Future<void> gobackTodetails(BuildContext context) async {
    await Navigator.of(context)
        .pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => ListEnter()), (route) => false);
  }

  void navigateToDetails(BuildContext context, StudentModel student) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Details(
                student: student,
              )),
    );
  }