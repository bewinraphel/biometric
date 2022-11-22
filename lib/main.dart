import 'package:apps/model/hive_model.dart';
import 'package:apps/utils/routes/routes_name.dart';
import 'package:apps/view/biometric_page.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'utils/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(hivemodelListAdapter().typeId)) {
    Hive.registerAdapter(hivemodelListAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routesname.biometricautheticatepage,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
