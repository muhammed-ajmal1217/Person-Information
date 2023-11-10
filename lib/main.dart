import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/model/StudentModel.dart';
import 'package:studentapp/pages/homePage.dart';
import 'package:studentapp/provider/list_adding_provider.dart';
import 'package:studentapp/provider/list_editing_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => listAddingProvider(),),
        ChangeNotifierProvider(create: (context) => listEditingProvider(),),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.highContrastLight(background: Color.fromARGB(255, 222, 224, 224)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}
