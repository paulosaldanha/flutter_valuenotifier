import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hello/src/controller/holiday_controller.dart';
import 'package:hello/src/routes/router.dart';
import 'package:hello/src/routes/routing_constants.dart';
import 'package:hello/src/service/holiday_service.dart';

void main() {
  runApp(const MyApp());
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<HolidayController>(HolidayController(HolidayService()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
      onGenerateRoute: rotas(),
      initialRoute: HolidayListViewRoute,
    );
  }
}
